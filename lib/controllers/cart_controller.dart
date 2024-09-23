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

  // Define a getter for the subtotal
  double get subTotal => cartItems.fold(0, (sum, item) => sum + item.price);

  // Define a fixed shipping cost or calculate it as needed
  double get shipping => 5.85; // Example fixed shipping cost

  // Define a getter for the total cost
  double get cartTotal => subTotal + shipping;
}
