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

// กดรับMeeting
  static Future<Meetings?> acceptMeeting({required int meeting_id, required String status}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$pathApi/api/meetings_user_accept');
    final response = await http.post(url,
        body: jsonEncode({
          "meeting_id": meeting_id,
          "status": status,
        }),
        headers: {
          'Authorization': 'Bearer ${token}',
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      final responseString = jsonDecode(response.body);
      return Meetings.fromJson(responseString["data"]);
    } else {
      final responseString = jsonDecode(response.body);
      throw responseString['message'];
    }
  }
}
