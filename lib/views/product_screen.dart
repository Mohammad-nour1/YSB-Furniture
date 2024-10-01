import 'package:ecommerce/models/controllers/products_controller.dart';
import 'package:ecommerce/models/favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:ecommerce/controllers/favorites_controller.dart';
import 'package:ecommerce/routes/app_routes.dart';

class ProductsScreen extends StatelessWidget {
  final FavoritesController favoritesController =
      Get.find<FavoritesController>();
  final ProductsController productsController =
      Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    final String? category = Get.parameters['category'];

    return Scaffold(
      appBar: AppBar(
        title: Text(category != null ? '$category Products' : 'Products'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (productsController.products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        final filteredProducts = category != null
            ? productsController.products
                .where((product) => product.category == category)
                .toList()
            : productsController.products;

        return ListView.builder(
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.PRODUCTS_DETAILS_SCREEN,
                    arguments: product);
              },
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 150,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.5),
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '\$${product.price}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 5.0,
                                      color: Colors.black.withOpacity(0.5),
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 4),
                              Obx(() {
                                bool isFavorite =
                                    favoritesController.isFavorite(product as FavoriteProduct);
                                return IconButton(
                                  icon: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color:
                                        const Color.fromARGB(213, 244, 44, 44),
                                  ),
                                  onPressed: () {
                                    favoritesController
                                        .toggleFavorite(product as FavoriteProduct);
                                  },
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
