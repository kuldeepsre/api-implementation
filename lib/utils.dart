import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../endpoint/constants.dart';

enum UiDesignItems {
  table,
  card,
}
class Utils {
  static Future<http.Response> getApiCall(String url) {
   // EndPoint.headers['token'] = EndPoint.user_token;
    return http.get(Uri.parse(url), headers: EndPoint.headers);
  }
  static Future<http.Response> postApiCall(String url, var body) {
    var dt = jsonEncode(body);
    print(dt);
  //  EndPoint.headers['token'] = EndPoint.user_token;
    return http.post(Uri.parse(url), body: dt);
  }

}