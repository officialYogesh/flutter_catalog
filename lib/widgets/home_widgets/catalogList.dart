import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routs.dart';

import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/screens/itemDetailsScreen.dart';

import 'package:flutter_catalog/models/catalogModel.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalogImage.dart';
import 'package:flutter_catalog/widgets/home_widgets/addToCart.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        final String catalogId = catalog.id.toString();
        return InkWell(
            onTap: () => context.vxNav.push(
                Uri(
                    path: MyRoutes.itemDetailsRoute,
                    queryParameters: {"id": catalogId}),
                params: catalog),
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => ItemDetailsScreen(catalog: catalog))),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.lg.color(context.accentColor).make(),
              catalog.desc.text.gray500
                  .subtitle2(context)
                  // .textStyle(context.captionStyle)
                  .make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  AddToCart(catalog: catalog)
                ],
              ).pOnly(right: 8.0)
            ],
          ),
        )
      ],
    )).color(context.cardColor).rounded.square(150).make().py16();
  }
}
