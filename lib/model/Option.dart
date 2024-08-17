class Option {
  final int id;
  final String name;

  Option({required this.id, required this.name});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      name: json['name'],
    );
  }
}