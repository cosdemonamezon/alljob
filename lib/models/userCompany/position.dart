import 'package:alljob/models/userCompany/compay.dart';
import 'package:alljob/models/userCompany/detailPosition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'position.g.dart';

@JsonSerializable()
class Position {
  Position({
    this.id,
    this.compay,
    this.recruitment_companies,
  });

  int? id;
  Compay? compay;
  List<DetailPosition>? recruitment_companies;

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);

  Map<String, dynamic> toJson() => _$PositionToJson(this);
}
