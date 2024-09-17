import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <String>[].obs; // قائمة المنتجات في السلة

  void addItem(String product) {
    cartItems.add(product);
  }

  void removeItem(String product) {
    cartItems.remove(product);
  }
}
