import 'package:flutter/material.dart';
import 'package:pos/components/listile.dart';
import 'package:pos/controller/ticket.dart';
import 'package:pos/screens/openticket/ticket_details.dart';
import 'package:pos/screens/widgets/timeago.dart';

import 'package:provider/provider.dart';

class TicketsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _controller = Provider.of<TicketProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffF4F4F4),
      appBar: AppBar(
        title: Text(
          'Open Ticket (${_controller.openTicketList.length})',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios_new),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              primary: Color(0xff30B700),
            ),
            onPressed: () {},
            child: Text(
              'merge',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 18),
                child: Transform.scale(
                  scale: 0.7,
                  child: Transform.translate(
                    offset: Offset(0, 4),
                    child: Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.name,
                  decoration: new InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(left: 15, top: 15, right: 15),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(context, _controller);
                },
                icon: Icon(Icons.sort),
                splashRadius: 20,
              ),
            ],
          ),
          Divider(
            thickness: 1,
          ),
          Expanded(
            child: Container(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final openTicket = _controller.openTicketList[index];
                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      key: ValueKey(openTicket),
                      onDismissed: (direction) {
                        _controller.dismisDelete(openTicket);
                      },
                      background: Container(
                        padding: EdgeInsets.only(right: 20),
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Delete',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      child: TileListBox(
                        merge:
                            _controller.openTicketList[index].ismerged == true
                                ? Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text('Merge'),
                                  )
                                : null,
                        isChecked: openTicket.isChecked!,
                        chechBoxCallback: (val) {
                          _controller.changeSwitchValue(index);
                        },
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TicketDetail(index)),
                          );
                        },
                        created:
                            '${TimeAgo.timeAgoSinceDate(openTicket.created!)}',
                        taxTitle: '${openTicket.name}',
                        amount: '${openTicket.amount}',
                        iconData: Icons.person,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: _controller.openTicketList.length),
            ),
          ),
        ],
      ),
    );
  }

  void showDialog(BuildContext context, TicketProvider _controller) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 300),
      context: context,
      pageBuilder: (_, __, ___) {
        return Container(
          margin: const EdgeInsets.only(right: 15.0, top: 90),
          child: Align(
            alignment: Alignment.topRight,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: 162,
                height: 220,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10),
                        child: Text(
                          "Sort By",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      Column(
                        children: List.generate(
                          _controller.sortby.length,
                          (index) {
                            return AnimatedBuilder(
                              child: new Text(_controller.sortby.toString()),
                              animation: _controller.selectedItem,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: 0.9,
                                  child: RadioListTile<SortBy>(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(
                                      '${_controller.sortby[index].name}',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    value: _controller.sortby[index],
                                    groupValue: _controller.selectedItem.value,
                                    onChanged: (value) {
                                      _controller.selectedRadio(value!);
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ]),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
