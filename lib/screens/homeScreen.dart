import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/widgets/themes.dart';

import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/utils/routs.dart';

import 'package:flutter_catalog/models/catalog.dart';

import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalogHeader.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalogList.dart';

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
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.theme.buttonColor,
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
    );
  }

  void loadHomeData() async {
    await Future.delayed(Duration(seconds: 1));
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
