import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/products_overview.dart';
import 'models/product.dart';
import 'controllers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Products products = Get.put(Products());
  final Product product = Get.put(Product());
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        errorColor: Colors.red,
      ),
      title: 'MyShop',
      home: ProductsOverview(),
    );
  }
}
