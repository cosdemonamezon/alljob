import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../../constants/constants.dart';
import '../../../models/userModel/meetings.dart';

class MatchService {
  const MatchService();

  // รายละเอียดนัดหมายMeetings
  static Future<List<Meetings>> getMeetings({required int userId}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$pathApi/api/meetings_user/$userId');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final list = data['data'] as List;

      return list.map((e) => Meetings.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}
