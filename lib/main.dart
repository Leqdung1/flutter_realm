import 'package:flutter/material.dart';
import 'package:flutter_realm/screens/cart_screen.dart';
import 'package:flutter_realm/screens/catalog_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Provider Demo',
      initialRoute: '/catalog',
      routes: {
        '/catalog': (context) => const CatalogScreen(),
        '/cart': (context) => const CartScreen(),
      },
    );
  }
}
