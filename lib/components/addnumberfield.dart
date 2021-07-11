import 'package:flutter/material.dart';

class AddNumberField extends StatelessWidget {
  final String hintText;
  final String? validateText;
  final TextEditingController? textEditingController;
  final Function(String)? onChanged;
  const AddNumberField({
    Key? key,
    required this.hintText,
    this.textEditingController,
    this.validateText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter required value';
        }
      },
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE0E0E0)),
        ),
        hintText: hintText,
        //labelText: 'Enter the Value',
        errorText: validateText,
      ),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }
}
