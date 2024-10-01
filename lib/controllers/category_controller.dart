import 'package:ecommerce/services/category_service.dart';
import 'package:ecommerce/models/category.dart';
import 'package:get/get.dart';


class CategoryController extends GetxController {
  var categories = <Category>[].obs;
  final CategoryService categoryService = CategoryService();

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      final fetchedCategories = await categoryService.fetchCategories();
      categories.assignAll(fetchedCategories);
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }
}
