import 'package:json_annotation/json_annotation.dart';

part 'compay.g.dart';

@JsonSerializable()
class Compay {
  Compay({
    this.id,
    this.permission_id,
    this.username,
    this.name,
    this.email,
    this.phone,
    this.line_token,
    this.image,
    this.status,
    this.type,
    this.No,
  });

  int? id;
  String? permission_id;
  String? username;
  String? name;
  String? email;
  String? phone;
  String? line_token;
  String? image;
  String? status;
  String? type;
  int? No;

  factory Compay.fromJson(Map<String, dynamic> json) => _$CompayFromJson(json);

  Map<String, dynamic> toJson() => _$CompayToJson(this);
}
