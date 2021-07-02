import 'package:flutter/material.dart';
import 'package:pos/components/add_button_header.dart';
import 'package:pos/components/addtextfield.dart';
import 'package:pos/components/constrants.dart';

import 'package:pos/components/primary_button.dart';
import 'package:pos/components/secondary_button.dart';
import 'package:pos/controller/settings_controller.dart';
import 'package:pos/screens/widgets/item_dropdown_tax.dart';
import 'package:pos/screens/widgets/taxes_list.dart';
import 'package:pos/webview/components/header_container.dart';
import 'package:provider/provider.dart';

class TaxScreen extends StatefulWidget {
  const TaxScreen({Key? key}) : super(key: key);

  @override
  _TaxScreenState createState() => _TaxScreenState();
}

class _TaxScreenState extends State<TaxScreen> {
  final _taxTextController = TextEditingController();

  bool _validate = false;
  String? newTaxTitle;
  int selectedIndex = 0;

  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    _taxTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          showTaxList(context),
          addNewTax(context),
        ],
      ),
    );
  }

  Container showTaxList(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderContainer(
            title: 'Taxes',
            actions: [
              IconButton(
                onPressed: () {
                  var _controller =
                      Provider.of<SettingController>(context, listen: false);
                  _controller.removeTax(_controller.taxs[selectedIndex]);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              PrimaryButton(
                title: 'Add New',
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                onPressed: () {
                  pageController.animateToPage(1,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.ease);
                },
                icon: Icon(
                  Icons.add,
                  size: 16,
                ),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TaxesList((int index) {
                    selectedIndex = index;
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container addNewTax(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          HeaderContainer(
            title: 'Add new Tax',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Column(
              children: [
                AddTextField(
                  hintText: 'Tax name eg. VAT',
                  textEditingController: _taxTextController,
                  validateText: _validate ? 'Value Can\'t Be Empty' : null,
                  onChanged: (newText) {
                    newTaxTitle = newText;
                  },
                ),
                boxHeight,
                AddTextField(hintText: 'Tax rate in %'),
                boxHeight,
                ItemDropDownTax(),
                boxHeight,
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PrimaryButton(
                          title: 'Cancel',
                          onPressed: () {
                            if (_taxTextController.text.isNotEmpty) {
                              _taxTextController.clear();
                            } else {
                              pageController.animateToPage(0,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.ease);
                            }
                          }),
                      boxWidth,
                      SecondaryButton(
                        title: 'Save',
                        onPressed: () {
                          setState(() {
                            if (_taxTextController.text.isNotEmpty) {
                              _validate = false;
                              Provider.of<SettingController>(
                                context,
                                listen: false,
                              ).addTax(newTaxTitle!);
                              // taxs.add(TaxOption(taxName: newTaxTitle));
                              pageController.animateToPage(0,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.ease);
                            } else {
                              _validate = true;
                              print('error');
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
