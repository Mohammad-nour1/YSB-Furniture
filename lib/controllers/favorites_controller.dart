import 'package:ecommerce/services/favorite_service.dart';
import 'package:get/get.dart';
import 'package:ecommerce/models/productdetails.dart';
import 'package:ecommerce/models/favorite.dart';

class FavoritesController extends GetxController {
  var favoriteProducts = <FavoriteProduct>[].obs;
  final FavoriteProductService favoriteProductService = FavoriteProductService();

  @override
  void onInit() {
    super.onInit();
    fetchFavoriteProducts(); 
  }

  Future<void> fetchFavoriteProducts() async {
    try {
      final products = await favoriteProductService.getFavoriteProducts();
      favoriteProducts.assignAll(products);
    } catch (e) {
      print('Error fetching favorite products: $e');
    }
  }

  bool isFavorite(FavoriteProduct product) {
    return favoriteProducts.contains(product);
  }

  void addToFavorites(FavoriteProduct product) {
    if (!isFavorite(product)) {
      favoriteProducts.add(product);
    }
  }

  void removeFromFavorites(FavoriteProduct product) {
    if (isFavorite(product)) {
      favoriteProducts.remove(product);
    }
  }

  void toggleFavorite(FavoriteProduct product) {
    if (isFavorite(product)) {
      removeFromFavorites(product);
    } else {
      addToFavorites(product);
    }
  }
}
