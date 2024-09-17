// lib/screens/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/screens/check_out_screen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const Center(
            child: Text('Your cart is empty'),
          );
        } else {
          return ListView.builder(
            itemCount: cartController.cartItems.length,
            itemBuilder: (context, index) {
              final item = cartController.cartItems[index];
              return ListTile(
                leading: Image.network(item.imageUrl), // Assuming the `Product` model has an imageUrl field
                title: Text(item.name),
                subtitle: Text('Price: \$${item.price}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    cartController.removeItem(item);
                  },
                ),
              );
            },
          );
        }
      }),
      bottomNavigationBar: Obx(() {
        if (cartController.cartItems.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => CheckoutScreen());
              },
              child: const Text('Proceed to Checkout'),
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      }),
    );
  }
}
