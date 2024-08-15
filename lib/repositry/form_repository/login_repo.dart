import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:push/endpoint/constants.dart';
import 'package:push/endpoint/globleconstant.dart';

import '../../../api/api_services.dart';
import '../../../model/login_response.dart';
abstract class LoginRepository  {
  Future<LoginResponse> login(String username, String password);
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
}

