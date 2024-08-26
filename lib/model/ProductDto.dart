
  class ProductDto {
  final int id;
  final String name;
  final String category;
  final double price;
  final String imageUrl;
  int quantity; // Quantity of the product

  ProductDto({
  required this.id,
  required this.name,
  required this.category,
  required this.price,
  required this.imageUrl,
  this.quantity = 1, // Default quantity is 1
  });

  // Factory method to create a Product from JSON
  factory ProductDto.fromJson(Map<String, dynamic> json) {
  return ProductDto(
  id: json['id'],
  name: json['name'],
  category: json['category'],
  price: json['price'].toDouble(),
  imageUrl: json['imageUrl'],
  quantity: json['quantity'] ?? 1,
  );
  }

  // Method to convert Product to JSON
  Map<String, dynamic> toJson() => {
  'id': id,
  'name': name,
  'category': category,
  'price': price,
  'imageUrl': imageUrl,
  'quantity': quantity,
  };
  }
