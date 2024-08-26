class ChipItem {
  final int id;
  final String name;
  bool isSelected;

  ChipItem({
    required this.id,
    required this.name,
    this.isSelected = false,
  });

  factory ChipItem.fromJson(Map<String, dynamic> json) {
    return ChipItem(
      id: json['id'],
      name: json['name'],
      isSelected: json['isSelected'] ?? false,
    );
  }
}
