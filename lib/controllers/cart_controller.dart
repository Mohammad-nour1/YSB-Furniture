import 'package:get/get.dart';
import 'package:ecommerce/models/productdetails.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  void addItem(Product product) {
    cartItems.add(product);
  }

  void removeItem(Product product) {
    cartItems.remove(product);
  }

  double get subTotal => cartItems.fold(0, (sum, item) => sum + item.price);


  double get shipping => 5.85; 

  
  double get cartTotal => subTotal + shipping;
}
