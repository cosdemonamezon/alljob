import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    this.id,
    this.username,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.birthday,
    this.age,
    this.gender,
    this.marital,
  });

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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
