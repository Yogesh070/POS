import 'package:flutter/material.dart';
import 'package:pos/components/addnumberfield.dart';
import 'package:pos/components/addtextfield.dart';
import 'package:pos/components/constrants.dart';
import 'package:pos/components/primary_button.dart';
import 'package:pos/components/secondary_button.dart';
import 'package:pos/controller/settings_controller.dart';
import 'package:pos/screens/widgets/item_dropdown_tax.dart';
import 'package:pos/webview/components/header_container.dart';
import 'package:provider/provider.dart';

Future<void> addNewTaxDialog(BuildContext context) async {
  final _taxformkey = GlobalKey<FormState>();

  final _taxNameControllerMobile = TextEditingController();

  final _taxChargeRateControllerMobile = TextEditingController();

  String? newTaxTitle;
  String? newTaxCharge;

  return await showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 350,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderContainer(title: 'Add new Tax'),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 24),
                  child: Form(
                    key: _taxformkey,
                    child: Column(
                      children: [
                        boxHeight,
                        AddTextField(
                          hintText: 'Tax name eg. VAT',
                          textEditingController: _taxNameControllerMobile,
                          onChanged: (newText) {
                            newTaxTitle = newText;
                          },
                        ),
                        boxHeight,
                        AddNumberField(
                          hintText: 'Tax rate in%',
                          textEditingController: _taxChargeRateControllerMobile,
                          onChanged: (newCharge) {
                            newTaxCharge = newCharge;
                          },
                        ),
                        boxHeight,
                        ItemDropDownTax(),
                        boxHeight,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 23, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SecondaryButton(
                        title: 'Cancel',
                        onPressed: () {
                          if (_taxNameControllerMobile.text.isEmpty &&
                              _taxChargeRateControllerMobile.text.isEmpty) {
                            Navigator.pop(context);
                          } else {
                            _taxNameControllerMobile.clear();
                            _taxChargeRateControllerMobile.clear();
                          }
                        },
                      ),
                      boxWidth,
                      PrimaryButton(
                        title: 'Save',
                        onPressed: () {
                          if (_taxformkey.currentState!.validate()) {
                            Provider.of<SettingController>(context,
                                    listen: false)
                                .addMobileTax(newTaxTitle!, newTaxCharge!);
                            Navigator.pop(context);
                          } else {
                            print('error');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
