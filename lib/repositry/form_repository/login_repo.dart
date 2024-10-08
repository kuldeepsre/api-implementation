import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:push/endpoint/constants.dart';
import 'package:push/endpoint/globleconstant.dart';

import '../../../api/api_services.dart';
import '../../../model/login_response.dart';
import '../../model/Option.dart';
abstract class LoginRepository  {
  Future<LoginResponse> login(String username, String password);
  Future<List<Option>> fetchOptions();
}

class LoginPostRepositoryImpl implements LoginRepository {
  final ApiService apiService;

  LoginPostRepositoryImpl(this.apiService);

  @override
  Future<LoginResponse> login(String username, String password) async {
    try {
      final response = await apiService.login(username, password);
      if (response.statusCode == 200) {
        final jsonresult = json.decode(response.body);
        print("Response: $jsonresult");
        LoginResponse loginResponse=LoginResponse.fromJson(jsonresult);
        GlobleConstant.firstname=loginResponse.firstName!;
        GlobleConstant.lastName=loginResponse.lastName!;
        GlobleConstant.email=loginResponse.email!;

        return LoginResponse.fromJson(jsonresult);
      } else {
        final jsonresult = json.decode(response.body);
        print("Response Eror: $jsonresult");
        throw LoginException(
          statusCode: jsonresult['statusCode'],
          message: jsonresult['message'],
          error: jsonresult['error'],
        );
      }
    } catch (e) {
      // Handle exceptions and errors
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  @override
  Future<List<Option>> fetchOptions() async {
    final response = await http.get(Uri.parse('https://example.com/options'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Option.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load options');
    }
  }
}

