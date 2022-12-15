import 'package:alljob/models/userModel/userDetailJob.dart';
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
    this.image,
    this.address,
    this.birthday,
    this.age,
    this.gender,
    this.marital,
    this.user_job_detail,
  });

  int? id;
  String? username;
  String? name;
  String? phone;
  String? email;
  String? image;
  String? address;
  String? birthday;
  String? age;
  String? gender;
  String? marital;
  List<UserDetailJob>? user_job_detail;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
