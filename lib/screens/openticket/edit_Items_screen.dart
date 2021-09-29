import 'package:flutter/material.dart';
import 'package:pos/components/constrants.dart';
import 'package:pos/controller/ticket.dart';
import 'package:pos/screens/widgets/listbuilder/addson_builder.dart';
import 'package:pos/screens/widgets/listbuilder/discount_builder.dart';
import 'package:pos/screens/widgets/listbuilder/taxes_builder.dart';
import 'package:provider/provider.dart';

class EditItemScreen extends StatelessWidget {
  final int index;
  EditItemScreen(this.index);

  @override
  Widget build(BuildContext context) {
    var _controller = Provider.of<TicketProvider>(context);
    return Scaffold(
      appBar: appbar(context, _controller),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          boxHeight,
                          Text(
                            'Price',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                            ),
                          ),
                          boxHeight,
                          Text('Quantity'),
                          quantity(_controller),
                          boxHeight,
                        ],
                      ),
                    ),
                    LabelText(labelName: 'AddsOn'),
                    boxHeight,
                    divider,
                    AddOnsListBuilder(controller: _controller),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(thickness: 1),
                    ),
                    boxHeight,
                    LabelText(labelName: 'Discounts'),
                    boxHeight,
                    divider,
                    DiscountListBuilder(controller: _controller),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: divider,
                    ),
                    boxHeight,
                    LabelText(labelName: 'Taxes'),
                    boxHeight,
                    divider,
                    TaxBuilder(controller: _controller),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Additional comments',
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar appbar(BuildContext context, TicketProvider _controller) {
    return AppBar(
      leadingWidth: 30,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios_new),
      ),
      title: Text(
        '${_controller.itemsOrdered[index].itemName}',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            primary: Color(0xff30B700),
          ),
          child: Text('Save Changes'),
        )
      ],
    );
  }

  Row quantity(TicketProvider _controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xffB3B3B3),
              onSurface: Colors.white,
            ),
            onPressed: () {
              _controller.quanityDecrease();
            },
            child: Text('-'),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          flex: 7,
          child: TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          flex: 1,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xffB3B3B3),
              onSurface: Colors.white,
            ),
            onPressed: () {
              _controller.quanityIncrease();
            },
            child: Text('+'),
          ),
        ),
      ],
    );
  }
}
