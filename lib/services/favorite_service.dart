import 'dart:convert';
import 'package:ecommerce/models/favorite.dart';
import 'package:http/http.dart' as http;

class FavoriteProductService {
 
  static const String baseUrl = "https://furniture-api.mastercoders.dev/api";

  FavoriteProductService();

  Future<List<FavoriteProduct>> getFavoriteProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/get_favorite_product'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'success') {
        final List<dynamic> productsJson = data['data'];
        return productsJson.map((json) => FavoriteProduct.fromJson(json)).toList();
      } else {
        throw Exception('فشل في جلب البيانات: ${data['status']}');
      }
    } else {
      throw Exception('فشل في الاتصال بالخادم');
    }
  }
}
