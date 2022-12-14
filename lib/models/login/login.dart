import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login {
  Login(
      {this.id,
      this.username,
      this.name,
      this.phone,
      this.email,
      this.address,
      this.birthday,
      this.age,
      this.gender,
      this.marital,
      this.image,
      this.status,
      this.token});

  int? id;
  String? username;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? birthday;
  String? age;
  String? gender;
  String? marital;
  String? image;
  String? status;
  String? token;

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
