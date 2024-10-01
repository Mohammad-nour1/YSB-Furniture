class CartProduct {
  final int id;
  final String name;
  final int quantity;

  CartProduct({
    required this.id,
    required this.name,
    required this.quantity,
  });

 
  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
    );
  }

  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
    };
  }
}
