import 'package:get/get.dart';

class MySearchController extends GetxController {
  var query = ''.obs; // مراقبة المدخلات

  void updateQuery(String newQuery) {
    query.value = newQuery;
    // يمكن إضافة منطق البحث هنا
  }
}
