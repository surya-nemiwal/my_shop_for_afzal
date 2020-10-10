import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/products.dart';
import '../widgets/product_item.dart';

enum Choice {
  ShowOnlyFavorites,
  ShowAll,
}

class ProductsOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final products = showfavs ? productsProvider.getFavItems : productsProvider.getItems;
    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
      ),
      body: GetBuilder<Products>(builder: (productsController) {
        return productsController.productsLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetBuilder<Products>(builder: (productsController) {
                  final productList = productsController.getProdList;
                  return GridView.builder(
                    itemBuilder: (ctx, i) => ProductItem(productList[i]),
                    itemCount: productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 3 / 2,
                    ),
                  );
                }),
              );
      }),
      // drawer: MainDrawer(),
    );
  }
}
