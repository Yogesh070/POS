import 'package:flutter/material.dart';
import 'package:pos/components/custom_color_button.dart';
import 'package:pos/controller/storesController.dart';
import 'package:provider/provider.dart';

class StoresScreen extends StatefulWidget {
  @override
  _StoresScreenState createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  final _nameController = TextEditingController();

  final _locationController = TextEditingController();

  final _contactController = TextEditingController();

  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _storeController = Provider.of<StoreController>(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {},
        ),
        title: Text(
          "Stores",
          style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _nameController.clear();
          _contactController.clear();
          _descriptionController.clear();
          _locationController.clear();
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  content: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70.0)),
                    width: 325.0,
                    height: 404.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                          child: _headText("Add new store"),
                        ),
                        Divider(
                          thickness: 2.0,
                        ),
                        textFormFieldWidget(
                          _nameController,
                          "Enter name eg:Star Lounge",
                        ),
                        textFormFieldWidget(
                          _locationController,
                          "Location",
                        ),
                        textFormFieldWidget(
                          _contactController,
                          "Contact No",
                        ),
                        textFormFieldWidget(
                          _descriptionController,
                          "Description",
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    CustomButton(
                        title: "Cancel",
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: Colors.grey),
                    CustomButton(
                        title: "Save",
                        onPressed: () {
                          _storeController.addItemInTheList(
                              _nameController.text,
                              _locationController.text,
                              _contactController.text);
                          Navigator.of(context).pop();
                        },
                        color: Colors.green),
                  ],
                );
              });
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
      body: StoreBody(),
    );
  }

  Widget textFormFieldWidget(
      TextEditingController controller, String hintText) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0, right: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
        ),
        onChanged: (value) {},
      ),
    );
  }
}

class StoreBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _storeController = Provider.of<StoreController>(context);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 20.0, left: 20.0),
      child: Table(
        columnWidths: {
          0: FlexColumnWidth(0.7),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(0.5)
        },
        border: TableBorder(
            bottom: BorderSide(
              color: Colors.grey.shade200,
            ),
            horizontalInside: BorderSide(color: Colors.grey.shade200)),
        children: [
          TableRow(
            children: [
              TableCell(
                child: _headText("Name"),
              ),
              TableCell(
                child: _headText("Location"),
              ),
              TableCell(
                child: _headText("Contact"),
              ),
            ],
          ),
          for (var item in _storeController.storeOption)
            TableRow(children: [
              TableCell(child: _listText(item.name.toString())),
              TableCell(child: _listText(item.location.toString())),
              TableCell(child: _listText(item.contact.toString()))
            ])
        ],
      ),
    );
  }

  Widget _listText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }
}

Widget _headText(String head) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 12.0,
      bottom: 12.0,
    ),
    child: Text(
      head,
      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    ),
  );
}
