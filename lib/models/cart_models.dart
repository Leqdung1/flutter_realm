import 'package:flutter/material.dart';
import 'package:flutter_realm/models/catalog_model.dart';

class CartModel extends ChangeNotifier {
  late CatalogModel catalogModel;

  final List<Item> items = [];

  CatalogModel get catalog => catalogModel;

  set catalog(CatalogModel value) {
    catalogModel = value;

    notifyListeners();
  }

  void addItem(Item item) {
    items.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    items.remove(item);
    notifyListeners();
  }

  void clearAll() {
    items.clear();
    notifyListeners();
  }
}
