import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orderscreen/ConstantValues/colors.dart';
import 'package:orderscreen/Provider/paymentProvider.dart';
import 'package:orderscreen/model/paymentModel.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isChecked = false;
  final TextEditingController _paymentTypeName = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  PickedFile _imageFile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            style: secondMediumTextStyle,
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
      ),
    );
  }

  Widget _paymentContent() {
    PaymentNotifier paymentNotifier =
        Provider.of<PaymentNotifier>(context, listen: false);
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
                        onChanged: (bool value) {
                          setState(() {
                            notifier.paymentDetail[index].isSelected = value;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                          height: 50.0,
                          width: 60.0,
                          child: _imageFile == null
                              ? Image.asset('image/noimage.jpg')
                              : notifier.paymentDetail[index].image,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24.0,
                        ),
                        child: Text(
                          notifier.paymentDetail[index].paymentType,
                          style: normalMediumTextStyle,
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

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "Choose image",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.grey.shade300,
                  ),
                ),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.camera_alt,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 7.0,
                    ),
                    Text(
                      'Camera',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.grey.shade300,
                  ),
                ),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.image,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 7.0,
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final _pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = _pickedFile;
    });
  }

  void addPayment(BuildContext context) async {
    PaymentNotifier paymentNotifier =
        Provider.of<PaymentNotifier>(context, listen: false);
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            titlePadding: EdgeInsets.zero,
            scrollable: true,
            contentPadding:
                EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
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
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (builder) => bottomSheet());
                    },
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
                          style: elevationButtonTextStyle,
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
                      child: _imageFile != null
                          ? Image.file(
                              File(_imageFile.path),
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'image/noimage.jpg',
                              fit: BoxFit.cover,
                            )),
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
                        style: elevationButtonTextStyle,
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
                              Image.file(
                                File(_imageFile.path),
                              ),
                              false,
                            ),
                          );
                        });
                      },
                      child: Text(
                        'Save',
                        style: elevationButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
