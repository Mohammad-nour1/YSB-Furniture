import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controllers/favorites_controller.dart';


class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritesController = Get.find<FavoritesController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Obx(() {
        if (favoritesController.favoriteProducts.isEmpty) {
          return const Center(child: Text('No favorites yet.'));
        }
        return ListView.builder(
          itemCount: favoritesController.favoriteProducts.length,
          itemBuilder: (context, index) {
            final favoriteProduct = favoritesController.favoriteProducts[index];
            final product = favoriteProduct.product;
            return ListTile(
              leading: Image.network(product.mainImage),
              title: Text(product.name),
              subtitle: Text('\$${product.price}'),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle, color: Colors.red),
                onPressed: () {
                  favoritesController.removeFromFavorites(favoriteProduct);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
