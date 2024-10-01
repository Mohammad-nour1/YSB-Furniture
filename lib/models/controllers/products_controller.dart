import 'package:get/get.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/services/product_service.dart';

class ProductsController extends GetxController {
  var products = <Product>[].obs;
  final ProductService productService = ProductService();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final fetchedProducts = await productService.getProducts();
      products.assignAll(fetchedProducts);
    } catch (e) {
      print('Error fetching products: $e');
    }
  }
}
