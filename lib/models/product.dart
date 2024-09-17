// lib/models/product.dart
class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final List<int> colors; // تستخدم لتخزين الألوان بصيغة hex
  final List<String> materials;
  final List<String> fabrics;
  final Map<String, String> dimensions;
final String category; // تأكد من إضافة الخاصية category

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.colors,
    required this.materials,
    required this.fabrics,
    required this.dimensions,
     required this.category,
  });
}
