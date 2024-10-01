import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <String>[].obs;    

  void addItem(String product) {
    cartItems.add(product);
  }

  void removeItem(String product) {
    cartItems.remove(product);
  }
}
