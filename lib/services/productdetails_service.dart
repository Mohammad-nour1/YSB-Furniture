import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ecommerce/models/productdetails.dart';

class ProductService {
  final String baseUrl = "https://furniture-api.mastercoders.dev/api/getproductdetille";

  Future<Product> fetchProduct(String productId) async {
    final response = await http.get(Uri.parse('$baseUrl/$productId')); 

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Product.fromJson(data); 
    } else {
      throw Exception('فشل في تحميل المنتج');
    }
  }
}
