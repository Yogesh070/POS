import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/components/primary_button.dart';

import 'creditor_list.dart';

class AddNotificationCreditors extends StatefulWidget {
  const AddNotificationCreditors({Key? key}) : super(key: key);

  @override
  _AddNotificationCreditorsState createState() =>
      _AddNotificationCreditorsState();
}

class _AddNotificationCreditorsState extends State<AddNotificationCreditors> {
  XFile? _image;

  bool isSingleChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Notification',
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios_new),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        children: [
          GestureDetector(
            onTap: () {
              _showSelectImageDailoge();
            },
            child: DottedBorder(
              dashPattern: [10, 10],
              color: _image != null ? Colors.transparent : Colors.black,
              child: Container(
                width: double.infinity,
                height: 130,
                color: Color(0xffF4F4F4),
                child: _image == null
                    ? Center(
                        child: Text('+ Add Image'),
                      )
                    : Image(
                        image: FileImage(
                          File(_image!.path),
                        ),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 23.0),
            child: NotifiactionCustomRow(
              icon: Icons.title,
              label: "Title",
            ),
          ),
          NotifiactionCustomRow(
            icon: Icons.file_present,
            label: "Discription",
            maxLength: 160,
          ),
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CheckBoxWithTitle(title: 'Email', value: false),
              CheckBoxWithTitle(title: 'Free', value: false),
              CheckBoxWithTitle(title: 'SMS', value: false),
            ],
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 45),
              width: 100,
              child: PrimaryButton(
                title: 'Send',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CreditorList(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSelectImageDailoge() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: Text('Add photo'),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                _handleImage(source: ImageSource.camera);
              },
              child: Text('Take photo'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                _handleImage(source: ImageSource.gallery);
              },
              child: Text('Choose from Gallery'),
            ),
          ],
        );
      },
    );
  }

  void _handleImage({required ImageSource source}) async {
    Navigator.pop(context);

    XFile? imageFile = await ImagePicker().pickImage(source: source);

    if (imageFile != null) {
      setState(() {
        _image = imageFile;
      });
    }
  }
}

class NotifiactionCustomRow extends StatelessWidget {
  const NotifiactionCustomRow({
    Key? key,
    required this.icon,
    required this.label,
    this.contentPadding,
    this.maxLength,
  }) : super(key: key);
  final IconData icon;
  final String label;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 19),
        Expanded(
          child: TextField(
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            maxLength: maxLength ?? null,
            decoration: InputDecoration(
              contentPadding: contentPadding,
              label: Text('$label'),
              labelStyle: TextStyle(
                fontSize: 16,
                color: Color(0xff7A7A7A),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffE0E0E0),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffE0E0E0),
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffE0E0E0),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CheckBoxWithTitle extends StatelessWidget {
  const CheckBoxWithTitle({
    Key? key,
    required this.title,
    required this.value,
    this.onChanged,
  }) : super(key: key);
  final String title;
  final bool value;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.7,
          child: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            value: value,
            onChanged: onChanged,
          ),
        ),
        Text(title),
      ],
    );
  }
}

// class CustomTextfieldWithIcon extends StatelessWidget {
//   const CustomTextfieldWithIcon({
//     Key? key,
//     required this.text,
//     required this.icon,
//   }) : super(key: key);

//   final String text;
//   final IconData icon;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Icon(
//               icon,
//             ),
//           ),
//           Expanded(
//             flex: 4,
//             child: Container(
//               child: TextField(
//                 maxLength: 10,
//                 decoration: InputDecoration(
//                     contentPadding: EdgeInsets.zero,
//                     labelText: text,
//                     counterText: ''),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
