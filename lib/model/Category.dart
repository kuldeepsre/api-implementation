class Category {
  final int id;
  final String name;
  bool isSelected;

  Category({
    required this.id,
    required this.name,
    this.isSelected = false,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }
}
