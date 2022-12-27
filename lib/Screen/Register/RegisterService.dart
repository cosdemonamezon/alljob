import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/constants.dart';
import '../../models/userModel/user.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  const RegisterService();

  // Future<User?> setInformation({
  //   required String username,
  //   required String password,
  //   required String name,
  //   required String email,
  //   required String phone,
  //   required String birthday,
  //   required String gender,
  //   required String marital,
  // }) async {
  //   // SharedPreferences pref = await SharedPreferences.getInstance();
  //   // final token = pref.getString('token');
  //   final url = Uri.parse('$pathApi/api/user_job');
  //   final response = await http.post(url,
  //       body: jsonEncode({
  //         "username": username,
  //         "password": password,
  //         "name": name,
  //         "email": email,
  //         "phone": phone,
  //         "birthday": birthday,
  //         "gender": gender,
  //         "marital": marital,
  //       }),
  //       headers: {
  //         // 'Authorization': 'Bearer ${token}',
  //         'Content-Type': 'application/json',
  //       });
  //   if (response.statusCode == 200) {
  //     final responseString = jsonDecode(response.body);
  //     return User.fromJson(responseString["data"]);
  //   } else {
  //     final responseString = jsonDecode(response.body);
  //     throw responseString['message'];
  //   }
  // }

  Future<User?> setInformation({
    required String username,
    required String password,
    required String name,
    required String email,
    required String phone,
    required String birthday,
    required String gender,
    required String marital,
    required File image,
  }) async {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    // final token = pref.getString('token');
    final headers = {
      // 'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data'
    };
    final formData = FormData.fromMap(
      {
        "username": username,
        "password": password,
        "name": name,
        "email": email,
        "phone": phone,
        "birthday": birthday,
        "gender": gender,
        "marital": marital,
        'image': await MultipartFile.fromFile(image.path),
      },
    );
    try {
      final response = await Dio().post('$pathApi/api/user_job', data: formData, options: Options(headers: headers));

      return User.fromJson(response.data['data']);
    } on DioError catch (e) {
      throw (e.response?.data['message']);
    }
  }
}
