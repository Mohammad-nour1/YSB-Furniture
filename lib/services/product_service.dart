import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ecommerce/models/product.dart';

class ProductService {
  static const String baseUrl = "https://furniture-api.mastercoders.dev/api";

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/getproduct'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data is List) {
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception('Failed to connect to the server');
    }
  }
}
