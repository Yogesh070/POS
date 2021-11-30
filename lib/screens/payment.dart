import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/controller/payment_controller.dart';
import 'package:pos/model/paymentModel.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.0,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Payment',
          style: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      body: _paymentContent(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 30.0,
        ),
        child: FloatingActionButton(
          backgroundColor: Color(0xff30B700),
          onPressed: () {
            addPayment(context);
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }

  Widget _paymentContent() {
    PaymentNotifier paymentNotifier =
        Provider.of<PaymentNotifier>(context, listen: true);
    return Container(
      margin: EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: paymentNotifier.paymentDetail.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<PaymentNotifier>(
                builder: (context, notifier, child) {
                  return Row(
                    children: [
                      Checkbox(
                        value: notifier.paymentDetail[index].isSelected,
                        activeColor: Color(0xff30B700),
                        onChanged: (value) {
                          notifier.selectSingleCheckBox(value!, index);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          child: notifier.paymentDetail[index].image,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                        ),
                        child: Text(
                          notifier.paymentDetail[index].paymentType,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Divider(
                color: Color(0xffE0E0E0),
                thickness: 1.0,
              ),
            ],
          );
        },
      ),
    );
  }

  void addPayment(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialogeComponent();
        });
  }
}

class AlertDialogeComponent extends StatefulWidget {
  const AlertDialogeComponent({Key? key}) : super(key: key);

  @override
  _AlertDialogeComponentState createState() => _AlertDialogeComponentState();
}

class _AlertDialogeComponentState extends State<AlertDialogeComponent> {
  final TextEditingController _paymentTypeName = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  // XFile? _imageFile;
  XFile? file;
  Uint8List webImage = Uint8List(10);

  @override
  Widget build(BuildContext context) {
    PaymentNotifier paymentNotifier =
        Provider.of<PaymentNotifier>(context, listen: false);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      titlePadding: EdgeInsets.zero,
      scrollable: true,
      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
      title: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Text(
          'Make Payment',
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.8, color: Color(0xffE0E0E0)),
          ),
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Add Payment Type',
            ),
            controller: _paymentTypeName,
            validator: (String? value) {
              if (value == null) return ('Please add payment type');
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
            ),
            child: Text(
              'Choose Picture',
            ),
          ),
          Container(
            width: 170.0,
            padding: const EdgeInsets.only(top: 8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.black.withOpacity(
                    0.08,
                  ),
                ),
              ),
              onPressed: takeImage,
              // onPressed: () {
              //   //lll
              //   showModalBottomSheet(
              //     context: context,
              //     builder: (builder) => bottomSheet(context),
              //   );
              // },
              child: Row(
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Upload Image',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
            ),
            child: Container(
              height: 80.0,
              width: 80.0,
              child: file == null
                  ? Container()
                  : (kIsWeb)
                      ? Image.memory(
                          webImage,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          File(file!.path),
                          fit: BoxFit.cover,
                        ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.black.withOpacity(0.08),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xff30B700),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    paymentNotifier.addPayment(
                      PaymentModel(
                        _paymentTypeName.text,
                        kIsWeb
                            ? Image.memory(
                                webImage,
                                fit: BoxFit.contain,
                              )
                            : Image.file(
                                File(file!.path),
                              ),
                        false,
                      ),
                    );
                  });
                  Navigator.pop(context);
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  takeImage() async {
    // MOBILE
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        // var selected = XFile(image.path);

        setState(() {
          file = XFile(image.path);
          print(file!.path.toString());
        });
      }
    }
    // WEB
    else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          file = XFile(image.path);
          webImage = f;
        });
      }
    }
  }

  // void takePhoto(ImageSource source) async {
  //   final _pickedFile = await _picker.pickImage(
  //     source: source,
  //   );
  //   setState(() {
  //     _imageFile = _pickedFile;
  //   });
  // }

  // Widget bottomSheet(BuildContext context) {
  //   return Container(
  //     height: 100.0,
  //     width: MediaQuery.of(context).size.width,
  //     margin: EdgeInsets.symmetric(
  //       horizontal: 20,
  //       vertical: 20,
  //     ),
  //     child: Column(
  //       children: [
  //         Text(
  //           "Choose image",
  //           style: TextStyle(
  //             fontSize: 20.0,
  //           ),
  //         ),
  //         SizedBox(
  //           height: 20.0,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             ElevatedButton(
  //               style: ButtonStyle(
  //                 backgroundColor: MaterialStateProperty.all<Color>(
  //                   Colors.grey.shade300,
  //                 ),
  //               ),
  //               onPressed: () {
  //                 takePhoto(ImageSource.camera);
  //                 Navigator.pop(context);
  //               },
  //               child: Row(
  //                 children: [
  //                   Icon(
  //                     Icons.camera_alt,
  //                     color: Colors.black,
  //                   ),
  //                   SizedBox(
  //                     width: 7.0,
  //                   ),
  //                   Text(
  //                     'Camera',
  //                     style: TextStyle(
  //                       fontSize: 16.0,
  //                       color: Colors.black,
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //             Spacer(),
  //             ElevatedButton(
  //               style: ButtonStyle(
  //                 backgroundColor: MaterialStateProperty.all<Color>(
  //                   Colors.grey.shade300,
  //                 ),
  //               ),
  //               onPressed: () {
  //                 takePhoto(ImageSource.gallery);
  //                 Navigator.pop(context);
  //               },
  //               child: Row(
  //                 children: [
  //                   Icon(
  //                     Icons.image,
  //                     color: Colors.black,
  //                   ),
  //                   SizedBox(
  //                     width: 7.0,
  //                   ),
  //                   Text(
  //                     'Gallery',
  //                     style: TextStyle(
  //                       fontSize: 16.0,
  //                       color: Colors.black,
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             )
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }
}
