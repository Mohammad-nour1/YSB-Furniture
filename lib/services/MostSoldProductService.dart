import 'dart:convert';
import 'package:ecommerce/models/MostSoldProduct.dart';
import 'package:http/http.dart' as http;

class MostSoldProductService {
 
  static const String baseUrl = "https://furniture-api.mastercoders.dev/api";

  MostSoldProductService();

  Future<List<MostSoldProduct>> getMostSoldProductsByQuantity() async {
    final response = await http.get(Uri.parse('$baseUrl/getMostSoldProductsByQuantity'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'success') {
        final List<dynamic> productsJson = data['data'];
        return productsJson.map((json) => MostSoldProduct.fromJson(json)).toList();
      } else {
        throw Exception('فشل في جلب البيانات: ${data['status']}');
      }
    } else {
      throw Exception('فشل في الاتصال بالخادم');
    }
  }
}
