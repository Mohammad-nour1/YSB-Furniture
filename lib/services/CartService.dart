import 'dart:convert';
import 'package:ecommerce/models/getUserCartProducts.dart';
import 'package:http/http.dart' as http;

class CartService {
  
  static const String baseUrl = "https://furniture-api.mastercoders.dev/api";

  CartService();

  Future<List<CartProduct>> getUserCartProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/getUserCartProducts'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'success') {
        final List<dynamic> productsJson = data['data'];
        return productsJson.map((json) => CartProduct.fromJson(json)).toList();
      } else {
        throw Exception('فشل في جلب البيانات: ${data['status']}');
      }
    } else {
      throw Exception('فشل في الاتصال بالخادم');
    }
  }
}
