import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/core/AppStore.dart';
import 'package:flutter_catalog/models/cartModel.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [_CartList().p32().expand(), Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as AppStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
              child: VxBuilder<AppStore>(
                  builder: (context, store, _) {
                    return "\$${_cart.totalPrice}"
                        .text
                        .xl5
                        .color(context.theme.accentColor)
                        .make();
                  },
                  mutations: {RemoveFromCartMutation})),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not supported yet!".text.make()));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor)),
                  child: "Buy".text.color(Colors.white).xl.make())
              .w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveFromCartMutation]);
    final CartModel _cart = (VxState.store as AppStore).cart;
    return _cart.items.isEmpty
        ? "Cart is empty :(".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              title: _cart.items[index].name.text.make(),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () => RemoveFromCartMutation(_cart.items[index]),
              ),
            ),
          );
  }
}
