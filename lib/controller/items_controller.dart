import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pos/model/item.dart';
import 'package:http/http.dart' as http;

class ItemsController extends ChangeNotifier {
  List<Item> sortedList = [];
  List<Item> _items = [];
  List<Item> get items => _items;
  bool isItemLoaded = false;
  void sortByCategory(category) {
    sortedList = _items
        .where((element) => element.categories!.contains(category))
        .toList();
  }

  Future<List<Item>> fetchItems() async {
    if (!isItemLoaded) {
      final response =
          await http.get(Uri.parse('http://13.58.181.31/api/dalle/products'));
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body)['data'];
        Iterable list = result['products'];
        _items = list.map((model) => Item.fromJson(model)).toList();
        isItemLoaded = true;
      } else {
        throw Exception('Failed to load Items');
      }
    }
    return _items;
  }
}
