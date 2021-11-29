import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/components/primary_button.dart';
import 'package:pos/controller/notificationcontroller.dart';
import 'package:pos/screens/addclients/addclients.dart';
import 'package:pos/utilities/constant.dart';
import 'package:provider/provider.dart';

class AddNotification extends StatelessWidget {
  const AddNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _con = Provider.of<NotificationController>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  _showSelectImageDailoge(context, _con);
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
                  child: _con.image == null
                      ? Center(
                          child: Text('+ Add Image'),
                        )
                      : Image(
                          image: FileImage(
                            File(_con.image!.path),
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
              boxHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CheckBoxWithTitle(
                    title: 'All',
                    value: _con.allNotification[0].value,
                    onChanged: (value) {
                      _con.isCheckAll(value);
                    },
                  ),
                  Row(
                    children: List.generate(_con.notification.length, (index) {
                      return CheckBoxWithTitle(
                        title: '${_con.notification[index].title}',
                        value: _con.notification[index].value,
                        onChanged: (value) {
                          _con.isSingleCheck(index, value);
                        },
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Center(
                child: Container(
                  width: 100,
                  child: PrimaryButton(
                    title: 'Send',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddClient(),
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

  void _showSelectImageDailoge(context, NotificationController _con) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: Text('Add photo'),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                _con.handleImage(source: ImageSource.camera, context: context);
              },
              child: Text('Take photo'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                _con.handleImage(source: ImageSource.gallery, context: context);
              },
              child: Text('Choose from Gallery'),
            ),
          ],
        );
      },
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
