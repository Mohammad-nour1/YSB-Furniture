// lib/controllers/favorites_controller.dart
import 'package:get/get.dart';
import 'package:ecommerce/models/product.dart';

class FavoritesController extends GetxController {
  var favoriteProducts = <Product>[].obs;

  bool isFavorite(Product product) {
    return favoriteProducts.contains(product);
  }

  void addToFavorites(Product product) {
    if (!isFavorite(product)) {
      favoriteProducts.add(product);
    }
  }

  void removeFromFavorites(Product product) {
    if (isFavorite(product)) {
      favoriteProducts.remove(product);
    }
  }

  void toggleFavorite(Product product) {
    if (isFavorite(product)) {
      removeFromFavorites(product);
    } else {
      addToFavorites(product);
    }
  }
}
