import 'package:ecommerce/services/MostSoldProductService.dart';
import 'package:ecommerce/models/MostSoldProduct.dart';
import 'package:get/get.dart';


class MostSoldProductsController extends GetxController {
  var mostSoldProducts = <MostSoldProduct>[].obs;
  final MostSoldProductService mostSoldProductService = MostSoldProductService();

  @override
  void onInit() {
    fetchMostSoldProducts();
    super.onInit();
  }

  Future<void> fetchMostSoldProducts() async {
    try {
      final fetchedProducts = await mostSoldProductService.getMostSoldProductsByQuantity();
      mostSoldProducts.assignAll(fetchedProducts);
    } catch (e) {
      print('Error fetching most sold products: $e');
    }
  }
}
