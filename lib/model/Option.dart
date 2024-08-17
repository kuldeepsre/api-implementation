import 'dart:convert';
import 'package:http/http.dart' as http;
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
// Function to fetch options from a remote source
Future<List<Option>> fetchOptions() async {
  final response = await http.get(Uri.parse('https://example.com/options'));
  if (response.statusCode == 200) {
    List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((json) => Option.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load options');
  }
}