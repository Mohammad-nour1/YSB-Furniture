import 'package:ecommerce/models/productdetails.dart';

class MostSoldProduct {
  final Product product;
  final int quantitySold;

  MostSoldProduct({
    required this.product,
    required this.quantitySold,
  });


  factory MostSoldProduct.fromJson(Map<String, dynamic> json) {
    return MostSoldProduct(
      product: Product.fromJson(json['product']), 
      quantitySold: json['quantitySold'],
    );
  }

 
  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantitySold': quantitySold,
    };
  }
}
