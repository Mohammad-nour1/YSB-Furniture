class Product {
  final String name;
  final double price;
  final String mainImage;
  final int categoryId;
  final String description;
  final String color;
  final String material;
  final String fabric;
  final double length;
  final double depth;
  final double height;
  final double seatHeight;
  final double armHeight;
  final double seatDepth;
  final double legHeight;

  Product({
    required this.name,
    required this.price,
    required this.mainImage,
    required this.categoryId,
    required this.description,
    required this.color,
    required this.material,
    required this.fabric,
    required this.length,
    required this.depth,
    required this.height,
    required this.seatHeight,
    required this.armHeight,
    required this.seatDepth,
    required this.legHeight,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['p_name'] as String,
      price: json['p_price'] as double,
      mainImage: json['main_image'] as String,
      categoryId: json['cat_id'] as int,
      description: json['description'] as String,
      color: json['color'] as String,
      material: json['material'] as String,
      fabric: json['fabric'] as String,
      length: (json['length'] as num).toDouble(),
      depth: (json['depth'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      seatHeight: (json['seat_height'] as num).toDouble(),
      armHeight: (json['arm_height'] as num).toDouble(),
      seatDepth: (json['seat_depth'] as num).toDouble(),
      legHeight: (json['leg_height'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'p_name': name,
      'p_price': price,
      'main_image': mainImage,
      'cat_id': categoryId,
      'description': description,
      'color': color,
      'material': material,
      'fabric': fabric,
      'length': length,
      'depth': depth,
      'height': height,
      'seat_height': seatHeight,
      'arm_height': armHeight,
      'seat_depth': seatDepth,
      'leg_height': legHeight,
    };
  }
}
