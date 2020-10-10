import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  ProductItem(this.product);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black38,
            leading: GetBuilder<Product>(builder: (productController) {
              return IconButton(
                icon: Icon(
                  productController.favorite.value ? Icons.favorite : Icons.favorite_border,
                  color: Get.theme.primaryColor,
                ),
                onPressed: () => productController.toggleFavorite(),
              );
            }),
            title: Text(
              product.title,
              style: TextStyle(fontSize: 12),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).primaryColorDark,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
