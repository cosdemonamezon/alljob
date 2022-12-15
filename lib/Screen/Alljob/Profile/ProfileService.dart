import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/constants.dart';
import 'package:http/http.dart' as http;

import '../../../models/userModel/userDetailJob.dart';

class ProfileService {
  const ProfileService();

  Future<UserDetailJob?> setInformationDetil({
    String? user_job_id,
    String? location_of_educate,
    String? major,
    String? degree,
    String? grade,
    String? finished,
    String? thai,
    String? english,
    String? china,
    String? japan,
    String? exp,
    String? position,
    String? salary,
    String? remark,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$pathApi/api/user_job_detail');
    final response = await http.post(url,
        body: jsonEncode({
          "user_job_id": user_job_id,
          "location_of_educate": location_of_educate,
          "major": major,
          "degree": degree,
          "grade": grade,
          "finished": finished,
          "thai": thai,
          "english": english,
          "china": china,
          "japan": japan,
          "exp": exp,
          "position": position,
          "salary": salary,
          "remark": remark,
        }),
        headers: {
          'Authorization': 'Bearer ${token}',
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      final responseString = jsonDecode(response.body);
      return UserDetailJob.fromJson(responseString["data"]);
    } else {
      final responseString = jsonDecode(response.body);
      throw responseString['message'];
    }
  }
}
