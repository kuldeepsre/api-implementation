import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:push/endpoint/constants.dart';

import '../utils.dart';
class ApiService {
  var baseUrl="https://api.lyfcon.com/auth/demo";
  Future<http.Response> login(String username, String password) async {
    final url = '$baseUrl/login'; // Construct the full URL

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        // 'email': '$username',
           'email': 'codingskills-demo101@mejidigital.in',
            'password': 'demo101',
      }),
    );
        return response;
 /*   return Utils.postApiCall(url, {
      "email": "codingskills-demo101@mejidigital.in",
      "password": "demo101",
    });*/
  }
}