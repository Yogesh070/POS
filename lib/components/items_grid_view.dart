import 'package:flutter/material.dart';

class ItemsGridView extends StatefulWidget {
  final List<String>? foods;

  ItemsGridView({@required this.foods});
  @override
  _ItemsGridViewState createState() => _ItemsGridViewState();
}

class _ItemsGridViewState extends State<ItemsGridView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: GridView.builder(
          itemCount: widget.foods!.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12),
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/a/a3/Eq_it-na_pizza-margherita_sep2005_sml.jpg'),
                  fit: BoxFit.cover),
            ),
            height: 115,
            width: 102,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.46),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                    widget.foods![index],
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
