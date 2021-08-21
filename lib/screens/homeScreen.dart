import 'package:flutter/material.dart';

import 'package:flutter_catalog/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String greetings = "Hello, world!";
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text(greetings),
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
