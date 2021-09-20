import 'package:flutter/material.dart';
import 'package:pos/utilities/constant.dart';

class CreateCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: (MediaQuery.of(context).size.width < 600)
          ? AppBar(
              elevation: 0,
              titleSpacing: 10,
              backgroundColor: Colors.white,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(2),
                child: Divider(),
              ),
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              title: Text(
                'CREATE CUSTOMER',
                style: kAppBarText,
              ),
            )
          : PreferredSize(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Register Customer',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.popUntil(context, ModalRoute.withName('/'));
                      },
                      child: Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(60)),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'Name',
                labelText: 'Name',
                icon: Icons.person,
                inputType: TextInputType.text,
                validationFunction: (value) {
                  return null;
                },
              ),
              CustomTextFormField(
                hintText: 'Email',
                labelText: 'Email',
                icon: Icons.email,
                inputType: TextInputType.emailAddress,
                validationFunction: (value) {
                  return null;
                },
              ),
              CustomTextFormField(
                hintText: 'Phone',
                labelText: 'Phone',
                icon: Icons.phone,
                inputType: TextInputType.phone,
                validationFunction: (value) {
                  return null;
                },
              ),
              CustomTextFormField(
                hintText: 'Address',
                labelText: 'Address',
                icon: Icons.pin_drop,
                inputType: TextInputType.text,
                validationFunction: (value) {
                  return null;
                },
              ),
              CustomTextFormField(
                hintText: 'Note',
                labelText: 'Note',
                icon: Icons.message,
                inputType: TextInputType.text,
                validationFunction: (value) {
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) =>
                      (states.contains(MaterialState.pressed))
                          ? kDefaultGreen.withOpacity(0.5)
                          : kDefaultGreen),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 54),
                  ),
                ),
                onPressed: () {
                  print('Save');
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final String hintText;
  final TextInputType inputType;
  final String? Function(String?) validationFunction;

  CustomTextFormField(
      {Key? key,
      required this.icon,
      required this.labelText,
      required this.hintText,
      required this.inputType,
      required this.validationFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        keyboardType: inputType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 0, bottom: 8),
          alignLabelWithHint: true,
          icon: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Icon(
              icon,
              color: kIconColor,
            ),
          ),
          hintText: hintText,
          labelStyle: TextStyle(color: kAccentColor),
          labelText: labelText,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kBorderColor, width: 1),
          ),
        ),
        onSaved: (String? value) {
          // This optional block of code can be used to run
          // code when the user saves the form.
        },
        validator: validationFunction,
      ),
    );
  }
}
