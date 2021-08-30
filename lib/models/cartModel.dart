import 'package:flutter_catalog/models/catalogModel.dart';

class CartModel {
  // * Making class singleton i.e. only one instance will be created and shared
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  // Catalog field
  late CatalogModel _catalog;

  // Collection of ids - store ids of each items
  final List<int> _itemIds = [];

  // Getter for catalog
  CatalogModel get catalog => _catalog;

  // Set the _catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items =>
      _itemIds.map((id) => _catalog.getItemById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, currentItem) => total + currentItem.price);

  // Method to add items
  void addItem(Item item) {
    _itemIds.add(item.id);
  }

  // Method to remove items
  void removeItem(Item item) {
    _itemIds.remove(item.id);
  }
}
