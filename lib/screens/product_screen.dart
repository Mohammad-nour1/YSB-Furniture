import 'package:ecommerce/data/products_data_screen.dart';
import 'package:ecommerce/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/controllers/favorites_controller.dart';
import 'package:ecommerce/data/products_data_screen.dart'; // تأكد من أن المسار صحيح

class ProductsScreen extends StatelessWidget {
  final FavoritesController favoritesController =
      Get.find<FavoritesController>();

  @override
  Widget build(BuildContext context) {
    // الحصول على الفئة من المعلمات
    final String? category = Get.parameters['category'];

    // تصفية المنتجات بناءً على الفئة إذا كانت موجودة
    final filteredProducts = category != null
        ? products.where((product) => product.category == category).toList()
        : products;

    return Scaffold(
      appBar: AppBar(
        title: Text(category != null ? '$category Products' : 'Products'),
        centerTitle: true,
      ),
      body: ListView.builder(
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
                                offset: Offset(0, 2),
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
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 4),
                            Obx(() {
                              bool isFavorite =
                                  favoritesController.isFavorite(product);
                              return IconButton(
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: const Color.fromARGB(213, 244, 44, 44),
                                ),
                                onPressed: () {
                                  favoritesController.toggleFavorite(product);
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
      ),
    );
  }
}
