import '../../constants/constants.dart';
import '../../models/userModel/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AppService {
  const AppService();

  Future<User> getProfile(String token, String id) async {
    final url = Uri.parse('$pathApi/api/user_job/$id');

    final headers = {'Authorization': 'Bearer $token'};

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return User.fromJson(data['data']);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}
