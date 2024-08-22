class Product {
  final String id;
  final String name;
  final String categoryId;

  Product({
    required this.id,
    required this.name,
    required this.categoryId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      categoryId: json['categoryId'] as String,
    );
  }
}