import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos/components/expandable_sidenav.dart';
import 'package:pos/components/items_grid_view.dart';
import 'package:pos/controller/items_controller.dart';
import 'package:pos/controller/settings_controller.dart';
import 'package:pos/controller/ticket.dart';
import 'package:pos/model/item.dart';
import 'package:pos/screens/add_customer.dart';
import 'package:pos/screens/itemlist.dart';
import 'package:pos/screens/openticket/tickets_screen.dart';
import 'package:pos/screens/settings.dart';
import 'package:pos/utilities/constant.dart';
import 'package:pos/webview/main_screen/sidemenu.dart';
import 'package:pos/controller/sidenav_controller.dart';
import 'package:provider/provider.dart';

import 'notification/notification.dart';
import 'notificationcreditors/dropdownnotificationcrediotrs.dart';

class MenuOptions {
  String title;
  IconData icon;
  MenuOptions({required this.title, required this.icon});
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;
  final List<String> items = [
    'All Items',
    'Discount',
    'Drinks',
    'Snacks',
    'Alcohol'
  ];
  final List<MenuOptions> menuOptions = [
    MenuOptions(title: 'Menu', icon: Icons.fastfood),
    MenuOptions(title: 'Bills', icon: Icons.line_style),
    MenuOptions(title: 'Items', icon: Icons.list),
    MenuOptions(title: 'Creditors', icon: Icons.credit_card),
    MenuOptions(title: 'Notifications', icon: Icons.notifications),
    MenuOptions(title: 'Settings', icon: Icons.settings),
    MenuOptions(title: 'Apps', icon: Icons.app_settings_alt),
    MenuOptions(title: 'Help', icon: Icons.help)
  ];
  String dropdownValue = 'All Items';

  double sidebarPanelWidth = 60.0;
  bool tapped = false;
  bool isSearchOpen = false;

  TextEditingController _controller = TextEditingController();
  bool isvisible = false;
  late FocusNode myfocusnode;
  int searchflex = 1;
  int itemsFlex = 4;
  late Future<List<Item>> futureItem;
  @override
  void initState() {
    super.initState();
    futureItem =
        Provider.of<ItemsController>(context, listen: false).fetchItems();
    myfocusnode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    myfocusnode.dispose();
  }

  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    List optionItems = Provider.of<SettingController>(context).optionItems;
    final List<PopupMenuItem> _popUpOptions = optionItems
        .map(
          (item) => PopupMenuItem(
            value: item,
            child: Text(item),
          ),
        )
        .toList();
    return Scaffold(
      key: Provider.of<SideNavController>(context, listen: false).scafoldKey,
      appBar: selectedIndex == 0
          ? AppBar(
              titleSpacing: 10,
              elevation: 0,
              excludeHeaderSemantics: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () => (media.width < 600)
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddCustomer(),
                                  ),
                                )
                              : showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SimpleDialog(
                                      children: [
                                        Container(
                                          width: 600,
                                          height: 800,
                                          child: AddCustomer(),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                          child: Icon(Icons.person_add_alt_1_sharp)),
                      PopupMenuButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        itemBuilder: (context) => _popUpOptions,
                        onSelected: (val) {
                          if (val.toString() == 'Grid View' ||
                              val.toString() == 'List View') {
                            Provider.of<SettingController>(context,
                                    listen: false)
                                .changeLayout();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
              toolbarHeight: 80,
              title: Row(
                children: [
                  Text(
                    'Ticket',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Stack(
                    children: [
                      SvgPicture.asset(
                        'assets/images/Ticket White.svg',
                        color: Colors.black,
                        height: 36,
                        width: 27,
                      ),
                      Positioned(
                        child: Text(
                          '11',
                          style: TextStyle(color: Colors.white),
                        ),
                        top: 5,
                        left: 5,
                      ),
                    ],
                  ),
                ],
              ))
          : AppBar(
              title: Text(
                menuOptions[selectedIndex].title,
                style: TextStyle(color: Colors.black),
              ),
            ),
      body: Builder(
        builder: (context) {
          switch (selectedIndex) {
            case 0:
              return newHome(media);
            case 1:
              return Center(child: Text('Bills'));
            case 2:
              return ItemList();
            case 3:
              return DropdownNotificationCreditor();
            case 4:
              return AddNotification();
            case 5:
              return Settings();
            case 6:
              return Center(child: Text('App'));
            case 7:
              return Center(child: Text('Help'));
            default:
          }
          return Container();
        },
      ),
      drawer: SideMenu(
        onNavIndexChanged: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedIndex: selectedIndex,
        menuOptions: menuOptions,
      ),
    );
  }

  Row newHome(Size media) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              (media.width < 600)
                  ? Container(
                      margin: EdgeInsets.all(25),
                      child: TicketContainer(),
                    )
                  : Container(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
                decoration: (media.width > 600)
                    ? BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0x55d3d3d3),
                          offset: Offset(0, 5),
                        )
                      ])
                    : BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: kDefaultBackgroundColor,
                          width: 3,
                        ),
                      ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (media.width > 600)
                        ? IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              setState(() {
                                if (tapped == false) {
                                  sidebarPanelWidth = sidebarPanelWidth + 60;
                                }

                                if (tapped == true) {
                                  sidebarPanelWidth = sidebarPanelWidth - 60;
                                }
                                tapped = !tapped;
                              });
                            })
                        : Container(),
                    Visibility(
                      visible: (media.width < 600) ? !isvisible : true,
                      child: Expanded(
                        flex: (media.width < 920 && media.width > 600)
                            ? 4
                            : (media.width < 600)
                                ? itemsFlex
                                : 1,
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                              // isExpanded: true,
                              value: dropdownValue,
                              icon: Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: const Icon(Icons.arrow_drop_down),
                                ),
                              ),
                              iconSize: 35,
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: items
                                  .map((values) => DropdownMenuItem(
                                        child: Text(
                                          values,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        value: values,
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: (media.width < 600) ? searchflex : 4,
                      // flex: searchflex,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: (media.width < 600)
                              ? BoxDecoration(
                                  border: (isSearchOpen)
                                      ? null
                                      : Border(
                                          left: BorderSide(
                                            color: kDefaultBackgroundColor,
                                            width: 3,
                                          ),
                                        ))
                              : null,
                          child: Visibility(
                            visible: isvisible,
                            maintainState: false,
                            replacement: IconButton(
                                icon: Icon(Icons.search),
                                splashRadius: 1,
                                onPressed: () {
                                  setState(() {
                                    isvisible = !isvisible;
                                    myfocusnode.requestFocus();
                                    isSearchOpen = true;
                                  });
                                }),
                            child: TextField(
                              cursorColor: kDefaultGreen,
                              autofocus: false,
                              onEditingComplete: () {
                                setState(() {
                                  isvisible = !isvisible;
                                  itemsFlex = 4;
                                  searchflex = 0;
                                });
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                suffixIcon: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      myfocusnode.unfocus();
                                      setState(() {
                                        isvisible = !isvisible;
                                        isSearchOpen = !isSearchOpen;
                                      });
                                    },
                                    child: Icon(Icons.close),
                                  ),
                                ),
                              ),
                              focusNode: myfocusnode,
                              controller: _controller,
                            ),
                          ),
                        ),
                      ),
                    ),
                    (media.width > 600)
                        ? Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            // width: 184,
                            // padding: EdgeInsets.all(15),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 48, vertical: 12),
                            decoration: BoxDecoration(
                              color: kDefaultGreen,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              'Open Ticket',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    (media.width > 600)
                        ? ExpandableSidenav(
                            sidebarPanelWidth: sidebarPanelWidth,
                          )
                        : Container(),
                    Provider.of<ItemsController>(context).items.length > 0
                        ? ((Provider.of<SettingController>(context,
                                    listen: false)
                                .isListLayout)
                            ? ItemsListView(
                                futureItem: futureItem,
                              )
                            : ItemsGridView(futureItem: futureItem))
                        : Center(
                            child: Column(
                              children: [
                                Text('You have no Items Yet'),
                                Text('Go to items menu to add an item'),
                                Container(
                                  padding: EdgeInsets.all(15),
                                  color: kDefaultGreen,
                                  child: Text('GO TO ITEMS'),
                                )
                              ],
                            ),
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
        // media.width > 600 ? SidebarPayment() : Container(),
      ],
    );
  }
}

class ItemsListView extends StatelessWidget {
  const ItemsListView({
    required this.futureItem,
    Key? key,
  }) : super(key: key);
  final Future<List<Item>> futureItem;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          initialData: Provider.of<ItemsController>(context).items,
          future: futureItem,
          builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final item = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: CachedNetworkImage(
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            imageUrl: item.image!,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                color: kDefaultGreen,
                                value: downloadProgress.progress,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 1, color: kBorderColor),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Text(item.name),
                                ),
                                Text('Rs.${item.price}'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class TicketContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _controller = Provider.of<TicketProvider>(context);
    return Container(
      // height: 78,
      decoration: BoxDecoration(
        color: kDefaultGreen,
        borderRadius: BorderRadius.circular(5),
      ),
      // padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TicketsScreen(),
                  ),
                );
              },
              child: Column(
                children: [
                  Text(
                    'Open Tickets',
                    style: kSemiLargeText,
                  ),
                  Text(
                    '${_controller.openTicketList.length}',
                    style: kSemiLargeText,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(width: 1, color: kDefaultBackgroundColor),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Amount',
                    style: kSemiLargeText,
                  ),
                  Text(
                    '0.0',
                    style: kSemiLargeText,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
