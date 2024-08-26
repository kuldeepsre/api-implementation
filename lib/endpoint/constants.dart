import 'dart:ui';

import 'package:push/model/login_response.dart';

class EndPoint{
  static const BASE_URL = "https://api.lyfcon.com/auth/demo/";
  static String user_token = "";
  static String POST_LOGIN=BASE_URL + "login";

  static Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    'Content-Type': 'application/json; charset=UTF-8',
    'connection': 'keep-alive',
    //"app_key": "caeb1afaaeb9598a22a17d27ad3120a9754b5170b253b81da576404212052441",
   // "token": user_token
  };
  static const kPrimaryColor = Color(0xFF6F35A5);
  static const kPrimaryLightColor = Color(0xFFF1E6FF);
}

