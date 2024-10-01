import 'package:get/get.dart';

class MySearchController extends GetxController {
  var query = ''.obs; 

  void updateQuery(String newQuery) {
    query.value = newQuery;
  }
}
