import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/constants.dart';
import '../../models/userModel/user.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  const RegisterService();

  Future<User?> setInformation({
    required String username,
    required String password,
    required String name,
    required String email,
    required String phone,
    required String birthday,
    required String gender,
    required String marital,
  }) async {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    // final token = pref.getString('token');
    final url = Uri.parse('$pathApi/api/user_job');
    final response = await http.post(url,
        body: jsonEncode({
          "username": username,
          "password": password,
          "name": name,
          "email": email,
          "phone": phone,
          "birthday": birthday,
          "gender": gender,
          "marital": marital,
        }),
        headers: {
          // 'Authorization': 'Bearer ${token}',
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      final responseString = jsonDecode(response.body);
      return User.fromJson(responseString["data"]);
    } else {
      final responseString = jsonDecode(response.body);
      throw responseString['message'];
    }
  }
}
