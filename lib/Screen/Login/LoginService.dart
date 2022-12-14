import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../constants/constants.dart';
import '../../models/login/login.dart';

class LoginService {
  const LoginService();

  Future<Login?> loginUser(
    String username,
    String password,
  ) async {
    final url = Uri.parse('$pathApi/api/user_job_login');

    final response = await http.post(url, body: {
      "username": username,
      "password": password,
    });

    if (response.statusCode == 200) {
      final responseString = convert.jsonDecode(response.body);
      responseString['data']['token'] = responseString['token'];
      inspect(responseString);
      return Login.fromJson(responseString["data"]);
    } else {
      final responseString = jsonDecode(response.body);
      throw responseString['message'];
    }

    // if (response.statusCode == 200) {
    //   final responseString = jsonDecode(response.body);
    //   return EmailloginModel.fromJson(responseString["data"]);
    // } else {
    //   final responseString = jsonDecode(response.body);
    //   throw Exception(responseString["massage"]);
    // }
  }
}
