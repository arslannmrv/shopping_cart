import 'package:flutter/material.dart';
import 'package:shopping_cart/constants/constants.dart';
import 'shopping_cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: ColorConstants.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ShoppingCartPage(),
    );
  }
}
