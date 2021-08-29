import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/widgets/themes.dart';

import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

import 'package:flutter/services.dart';

import 'package:flutter_catalog/models/catalog.dart';

import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    loadHomeData();
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    // * comment stash 01
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Catalog App"),
    //   ),
    //   body: Padding(
    //       padding: EdgeInsets.all(16.0),
    //       child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
    //           ? ListView.builder(
    //               itemCount: CatalogModel.items.length,
    //               itemBuilder: (context, index) => ItemWidget(
    //                     item: CatalogModel.items[index],
    //                   ))
    //           : Center(
    //               child: CircularProgressIndicator(),
    //             )),
    //   drawer: MainDrawer(),
    // );
    return Scaffold(
      backgroundColor: MyThemes.cream,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }

  void loadHomeData() async {
    // await Future.delayed(Duration(seconds: 5));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyThemes.darkBluish).make(),
        "Trending Products".text.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
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
        CatalogImage(image: catalog.image),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.lg.color(MyThemes.darkBluish).make(),
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
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyThemes.darkBluish),
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      child: "Buy".text.make())
                ],
              ).pOnly(right: 8.0)
            ],
          ),
        )
      ],
    )).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyThemes.cream)
        .make()
        .p16()
        .w40(context);
  }
}
