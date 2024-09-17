// lib/screens/favorites_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controllers/favorites_controller.dart';
import 'package:ecommerce/models/product.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritesController = Get.find<FavoritesController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Obx(() {
        if (favoritesController.favoriteProducts.isEmpty) {
          return Center(child: Text('No favorites yet.'));
        }
        return ListView.builder(
          itemCount: favoritesController.favoriteProducts.length,
          itemBuilder: (context, index) {
            final product = favoritesController.favoriteProducts[index];
            return ListTile(
              leading: Image.network(product.imageUrl),
              title: Text(product.name),
              subtitle: Text('\$${product.price}'),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle, color: Colors.red),
                onPressed: () {
                  favoritesController.removeFromFavorites(product);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
