// lib/screens/categories_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/routes/app_routes.dart';

class CategoriesScreen extends StatelessWidget {
 
  final List<Map<String, String>> categories = [
    {
      'name': 'Chairs',
      'image':
          'https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'name': 'Sofas',
      'image':
          'https://images.pexels.com/photos/198272/pexels-photo-198272.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'name': 'Tables',
      'image':
          'https://images.pexels.com/photos/890669/pexels-photo-890669.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'name': 'Clocks',
      'image':
          'https://images.pexels.com/photos/27818256/pexels-photo-27818256/free-photo-of-a-large-clock-on-the-wall-of-a-building.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },

    // Add other categories similarly
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 2.1,
        ),
        padding: const EdgeInsets.all(9.0),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.PRODUCTS_SCREEN,
                  parameters: {'category': category['name']!});
            },
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.network(
                      category['image']!,
                      fit: BoxFit.cover,
                      height: 120,
                      width: double.infinity,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) {
                          return child;
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      category['name']!,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
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
