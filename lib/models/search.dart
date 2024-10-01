class SearchModel {
  final String productName;

  SearchModel({
    required this.productName,
  });

  
  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      productName: json['p_name'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'p_name': productName,
    };
  }
}
