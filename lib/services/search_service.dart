import 'dart:convert';
import 'package:ecommerce/models/productdetails.dart';
import 'package:http/http.dart' as http;

class SearchService {
  
  static const String baseUrl = "https://furniture-api.mastercoders.dev/api";

  SearchService();

  Future<List<Product>> searchProducts(String productName) async {
    final response = await http.post(
      Uri.parse('$baseUrl/search'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'p_name': productName,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'success') {
        final List<dynamic> productsJson = data['data'];
        return productsJson.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('فشل في جلب البيانات: ${data['status']}');
      }
    } else {
      throw Exception('فشل في الاتصال بالخادم');
    }
  }
}
