import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/core/AppStore.dart';
import 'package:flutter_catalog/models/catalogModel.dart';
import 'package:flutter_catalog/models/cartModel.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddToCartMutation]);
    final CartModel _cart = (VxState.store as AppStore).cart;
    bool isInCart = _cart.items.contains(catalog) ? true : false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddToCartMutation(catalog);
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus)
        // "Add to cart".text.make()
        );
  }
}
