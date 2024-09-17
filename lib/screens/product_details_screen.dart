// lib/screens/product_details_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/controllers/favorites_controller.dart';
import 'package:ecommerce/controllers/cart_controller.dart';

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Get.arguments;
    final FavoritesController favoritesController =
        Get.find<FavoritesController>();
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          Obx(() {
            bool isFavorite = favoritesController.isFavorite(product);
            return IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                favoritesController.toggleFavorite(product);
              },
            );
          }),
          IconButton(
            icon: Icon(Icons.shopping_bag),
            onPressed: () {
              Get.toNamed('/cart');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '\$${product.price}',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.description),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: product.colors.map((color) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color(color),
                      shape: BoxShape.circle,
                    ),
                  );
                }).toList(),
              ),
            ),
            ExpansionTile(
              title: Text('Materials'),
              children: product.materials
                  .map((material) => ListTile(title: Text(material)))
                  .toList(),
            ),
            ExpansionTile(
              title: Text('Fabrics'),
              children: product.fabrics
                  .map((fabric) => ListTile(title: Text(fabric)))
                  .toList(),
            ),
            ExpansionTile(
              title: Text('Dimensions'),
              children: product.dimensions.entries
                  .map((entry) =>
                      ListTile(title: Text('${entry.key}: ${entry.value}')))
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      cartController.addItem(product);
                      Get.snackbar(
                        'Added to Cart',
                        '${product.name} has been added to your cart',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      backgroundColor: Colors.orange,
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/checkout');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      backgroundColor: Colors.orange,
                    ),
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
