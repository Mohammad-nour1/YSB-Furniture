import 'package:ecommerce/models/productdetails.dart';

class FavoriteProduct {
  final Product product;

  FavoriteProduct({
    required this.product,
  });

  
  factory FavoriteProduct.fromJson(Map<String, dynamic> json) {
    return FavoriteProduct(
      product: Product.fromJson(json['product']),
    );
  }

  
  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
    };
  }
}
