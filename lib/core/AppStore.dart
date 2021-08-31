import 'package:flutter_catalog/models/cartModel.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/catalogModel.dart';

class AppStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  AppStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
