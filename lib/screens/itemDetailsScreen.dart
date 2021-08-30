import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';

import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/catalog.dart';

class ItemDetailsScreen extends StatelessWidget {
  final Item catalog;

  const ItemDetailsScreen({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyThemes.darkBluish),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add to cart".text.make())
                .wh(120, 50)
          ],
        ).p32(),
      ),
      backgroundColor: MyThemes.cream,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
                    height: 30.0,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: Colors.white,
                      width: context.screenWidth,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            catalog.name.text.xl4
                                .color(MyThemes.darkBluish)
                                .bold
                                .make(),
                            catalog.desc.text.gray500
                                .subtitle2(context)
                                .xl
                                .make(),
                            10.heightBox,
                            "Invidunt erat eirmod amet clita consetetur, magna dolore justo erat sanctus ut rebum erat dolore. Accusam dolores est dolore stet diam lorem, rebum sadipscing aliquyam aliquyam et lorem eos dolores at, justo aliquyam takimata diam lorem diam dolores voluptua dolor. Justo takimata kasd nonumy amet voluptua clita ipsum dolor, clita."
                                .text
                                .gray500
                                .subtitle2(context)
                                .make()
                                .px32()
                          ],
                        ).py64(),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
