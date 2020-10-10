import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class Products extends GetxController {
  RxList<Product> _items = List<Product>().obs;
  // print()
  static Products get to => Get.find();
  bool productsLoading = false;

  List<Product> get getProdList => [..._items];
  onInit() {
    getAndSetProducts();
    super.onInit();
  }

  Future<void> getAndSetProducts() async {
    productsLoading = true;
    update();
    var url = 'https://myshop-e3b7b.firebaseio.com/products.json';
    var response = await http.get(url);
    Map<String, dynamic> productsMap = json.decode(response.body);
    productsMap.forEach(
      (key, product) {
        _items.add(
          Product(
            id: key,
            price: product['price'],
            title: product['title'],
            description: product['description'],
            imageUrl: product['imageUrl'],
            favorite: product['favorite'],
          ),
        );
      },
    );
    productsLoading = false;
    update();
  }
}
