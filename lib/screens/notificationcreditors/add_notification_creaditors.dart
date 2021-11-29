import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/components/primary_button.dart';
import 'package:pos/screens/notificationcreditors/creditor_list.dart';

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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  _showSelectImageDailoge();
                },
                child: Container(
                  margin: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    border: Border.all(
                      width: 0.1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: double.infinity,
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
              CustomTextfieldWithIcon(
                text: 'Title',
                icon: Icons.photo,
              ),
              CustomTextfieldWithIcon(
                text: 'Documents',
                icon: Icons.file_present,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CheckBoxWithTitle(
                    title: 'Email',
                    value: isSingleChecked,
                    onChanged: (value) {
                      setState(() {
                        isSingleChecked = value!;
                      });
                    },
                  ),
                  CheckBoxWithTitle(title: 'App', value: false),
                  CheckBoxWithTitle(title: 'SMS', value: false),
                ],
              ),
              SizedBox(height: 40),
              Center(
                child: Container(
                  width: 100,
                  child: PrimaryButton(
                    // shape: BorderRadius.circular(5),
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
        ),
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
            value: value,
            onChanged: onChanged,
          ),
        ),
        Text(title),
      ],
    );
  }
}

class CustomTextfieldWithIcon extends StatelessWidget {
  const CustomTextfieldWithIcon({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Icon(
              icon,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: TextField(
                maxLength: 10,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    labelText: text,
                    counterText: ''),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
