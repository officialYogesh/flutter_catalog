import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/AppStore.dart';
import 'package:flutter_catalog/screens/itemDetailsScreen.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:flutter_catalog/utils/routs.dart';
import 'package:flutter_catalog/widgets/themes.dart';

import 'package:flutter_catalog/screens/homeScreen.dart';
import 'package:flutter_catalog/screens/loginScreen.dart';
import 'package:flutter_catalog/screens/cartScreen.dart';

void main() {
  // * To remove # from url
  setPathUrlStrategy();
  runApp(VxState(store: AppStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
        "/": (_, __) => MaterialPage(child: LoginScreen()),
        MyRoutes.loginRoute: (_, __) => MaterialPage(child: LoginScreen()),
        MyRoutes.homeRoute: (_, __) => MaterialPage(child: HomeScreen()),
        MyRoutes.itemDetailsRoute: (uri, params) {
          final catalog = (VxState.store as AppStore)
              .catalog
              .getItemById(int.parse(uri.queryParameters["id"].toString()));
          return MaterialPage(
              child: ItemDetailsScreen(
            catalog: catalog,
          ));
        },
        MyRoutes.cartRoute: (_, __) => MaterialPage(child: CartScreen())
      }),
      // initialRoute: MyRoutes.homeRoute,
      // routes: {
      //   "/": (contex) => LoginScreen(),
      //   MyRoutes.homeRoute: (contex) => HomeScreen(),
      //   MyRoutes.loginRoute: (contex) => LoginScreen(),
      //   MyRoutes.cartRoute: (context) => CartScreen()
      // },
    );
  }
}
