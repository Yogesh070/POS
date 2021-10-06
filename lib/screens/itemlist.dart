import 'package:flutter/material.dart';
import 'package:pos/screens/add_item.dart';
import 'package:pos/utilities/constant.dart';

enum FoodCategory {
  drinks,
  alcohol,
  snacks,
}

class Item {
  final String name;
  final int price;
  final bool? isOnStock;
  final FoodCategory? category;

  Item(
      {required this.name,
      required this.price,
      this.isOnStock = true,
      this.category});
}

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<Item> items = [
    Item(name: 'Black Tea', price: 30, category: FoodCategory.drinks),
    Item(name: 'Chowmin', price: 150, category: FoodCategory.snacks),
    Item(name: 'Coke', price: 140, category: FoodCategory.drinks),
    Item(name: 'Ice Cream', price: 50, category: FoodCategory.drinks),
    Item(name: 'Pakauda', price: 50, category: FoodCategory.snacks),
    Item(name: 'Sandwich', price: 150, category: FoodCategory.snacks),
    Item(name: 'Rum', price: 550, category: FoodCategory.alcohol),
    Item(name: 'Wiskey', price: 850, category: FoodCategory.alcohol),
    Item(name: 'Black Tea', price: 30, category: FoodCategory.drinks),
  ];
  FoodCategory _groupValue = FoodCategory.snacks;
  List<Item> sortedList = [];
  void sortByCategory() {
    setState(() {
      sortedList =
          items.where((element) => element.category == _groupValue).toList();
    });
  }

  void initState() {
    super.initState();
    sortByCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                PopupMenuButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  icon: Icon(Icons.sort),
                  onSelected: (FoodCategory val) {
                    setState(() {
                      _groupValue = val;
                    });
                    sortByCategory();
                  },
                  itemBuilder: (context) => <PopupMenuItem<FoodCategory>>[
                    PopupMenuItem(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sort by'),
                          Transform.scale(
                            scale: 1.2,
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      padding: EdgeInsets.zero,
                      child: ListTile(
                        visualDensity: VisualDensity.compact,
                        contentPadding: EdgeInsets.only(left: 0, right: 8),
                        horizontalTitleGap: 4,
                        leading: Radio<FoodCategory>(
                          value: FoodCategory.snacks,
                          groupValue: _groupValue,
                          onChanged: (FoodCategory? val) {
                            setState(() {
                              _groupValue = val!;
                            });
                          },
                        ),
                        title: Text('Snacks'),
                      ),
                      value: FoodCategory.snacks,
                    ),
                    PopupMenuItem(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 0, right: 8),
                        visualDensity: VisualDensity.compact,
                        horizontalTitleGap: 4,
                        leading: Radio<FoodCategory>(
                          value: FoodCategory.drinks,
                          groupValue: _groupValue,
                          onChanged: (FoodCategory? val) {
                            setState(() {
                              _groupValue = val!;
                            });
                          },
                        ),
                        title: Text('Drinks'),
                      ),
                      value: FoodCategory.drinks,
                    ),
                    PopupMenuItem(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ListTile(
                        horizontalTitleGap: 4,
                        visualDensity: VisualDensity.compact,
                        contentPadding: EdgeInsets.only(left: 0, right: 8),
                        leading: Radio<FoodCategory>(
                          value: FoodCategory.alcohol,
                          groupValue: _groupValue,
                          onChanged: (FoodCategory? val) {
                            setState(() {
                              _groupValue = val!;
                            });
                          },
                        ),
                        title: Text('Alcohol'),
                      ),
                      value: FoodCategory.alcohol,
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    child: Column(
                      children: sortedList
                          .asMap()
                          .entries
                          .map(
                            (item) => Column(
                              children: [
                                item.key != 0 ? Divider() : SizedBox.shrink(),
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/images/money.png'),
                                  ),
                                  title: Text(item.value.name),
                                  trailing: Text('Rs.${item.value.price}'),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kDefaultGreen,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddItem(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
