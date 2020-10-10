import 'package:get/get.dart';

// import 'package:http/http.dart' as http;

class Product extends GetxController {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  var favorite = false.obs;
  Product({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.price,
    bool favorite = false,
  }) {
    this.favorite.value = favorite;
  }
  void toggleFavorite() {
    print('in togglefav   $favorite $title');
    favorite.value = !favorite.value;
    update();
    // final url = 'https://myshop-e3b7b.firebaseio.com/products/$id.json';
    // print('in toggle');
    // final response = await http.patch(
    //   url,
    //   body: json.encode(
    //     {
    //       'favorite': favorite,
    //     },
    //   ),
    // );
    // print(response);
    // if (response.statusCode >= 400) {
    //   favorite = !favorite;
    // }
  }
}
