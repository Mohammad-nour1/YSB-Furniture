// lib/controllers/cart_controller.dart
import 'package:get/get.dart';
import 'package:ecommerce/models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  void addItem(Product product) {
    cartItems.add(product);
  }

  void removeItem(Product product) {
    cartItems.remove(product);
  }
}
