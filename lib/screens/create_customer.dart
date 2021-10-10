import 'package:flutter/material.dart';
import 'package:pos/components/primary_button.dart';
import 'package:pos/controller/customer_controller.dart';
import 'package:pos/model/customer.dart';
import 'package:pos/utilities/constant.dart';
import 'package:provider/provider.dart';

class CreateCustomer extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _note = TextEditingController();

  final _formKey = GlobalKey<FormState>();
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
                'Create Customer',
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
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'Name',
                labelText: 'Name',
                icon: Icons.person,
                inputType: TextInputType.text,
                validationFunction: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Name';
                  }
                  return null;
                },
                controller: _name,
              ),
              CustomTextFormField(
                hintText: 'Email',
                labelText: 'Email',
                icon: Icons.email,
                inputType: TextInputType.emailAddress,
                controller: _email,
                validationFunction: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                hintText: 'Phone',
                labelText: 'Phone',
                icon: Icons.phone,
                inputType: TextInputType.phone,
                controller: _phone,
                validationFunction: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Phone number';
                  } else if (value.length != 10) {
                    return 'Please enter valid phone number';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                hintText: 'Address',
                labelText: 'Address',
                icon: Icons.pin_drop,
                inputType: TextInputType.streetAddress,
                controller: _address,
                validationFunction: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Address';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                hintText: 'Note',
                labelText: 'Note',
                icon: Icons.message,
                inputType: TextInputType.text,
                controller: _note,
                validationFunction: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              PrimaryButton(
                  title: 'Save',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final customer = Customer(
                        email: _email.text,
                        name: _name.text,
                        phone: _phone.text,
                        address: _address.text,
                        note: _note.text,
                      );
                      print(customer.name);
                      Provider.of<CustomerController>(context, listen: false)
                          .addCustomer(customer);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Customer added')),
                      );
                      Navigator.pop(context);
                    }
                  })
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
  final TextEditingController? controller;

  const CustomTextFormField({
    Key? key,
    required this.icon,
    required this.labelText,
    required this.hintText,
    required this.inputType,
    required this.validationFunction,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        controller: controller,
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
