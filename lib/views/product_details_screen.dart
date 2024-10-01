import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/favorites_controller.dart';
import 'package:ecommerce/services/productdetails_service.dart';
import 'package:ecommerce/models/favorite.dart';
import 'package:ecommerce/models/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductService productService = ProductService();

  ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String productId = Get.arguments;
    final FavoritesController favoritesController = Get.find<FavoritesController>();
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          Obx(() {
            bool isFavorite = favoritesController.isFavorite(productId as FavoriteProduct);
            return IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                favoritesController.toggleFavorite(productId as FavoriteProduct);
              },
            );
          }),
          IconButton(
            icon: const Icon(Icons.shopping_bag),
            onPressed: () {
              Get.toNamed('/cart');
            },
          ),
        ],
      ),
      body: FutureBuilder<Product>(
        future: productService.fetchProduct(productId),  
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          }

          final product = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(product.mainImage), 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\$${product.price}',
                    style: const TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product.description),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Color: ${product.color}'),   
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Material: ${product.material}'), 
                ),
             
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Fabric: ${product.fabric}'),   
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Dimensions:'),
                      Text('Length: ${product.length}'),
                      Text('Depth: ${product.depth}'),
                      Text('Height: ${product.height}'),
                      Text('Seat Height: ${product.seatHeight}'),
                      Text('Arm Height: ${product.armHeight}'),
                      Text('Seat Depth: ${product.seatDepth}'),
                      Text('Leg Height: ${product.legHeight}'),
                    ],
                  ),
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
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
          );
        },
      ),
    );
  }
}
