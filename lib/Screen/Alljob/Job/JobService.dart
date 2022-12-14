import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/constants.dart';
import '../../../models/userCompany/compay.dart';
import '../../../models/userCompany/position.dart';

class JobService {
  const JobService();

  static Future<List<Compay>> listCompany() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$pathApi/api/get_user_company');

    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${token}',
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final list = data['data'] as List;

      return list.map((e) => Compay.fromJson(e)).toList();
    }
    return [];
  }

  static Future<List<Position>> getPosition({required int companyId}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$pathApi/api/recruitment_by_companie/$companyId');

    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${token}',
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final list = data['data'] as List;

      return list.map((e) => Position.fromJson(e)).toList();
    }
    return [];
  }

  // Future<Position?> getCompany({required int companyId}) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   final token = pref.getString('token');
  //   final url = Uri.parse('$pathApi/api/recruitment_by_companie//$companyId');

  //   final response = await http.get(url, headers: {
  //     'Authorization': 'Bearer ${token}',
  //     'Content-Type': 'application/json'
  //   });

  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);

  //     return Position.fromJson(data['data']);
  //   }
  //   return null;
  // }
}
