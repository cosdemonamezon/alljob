import 'package:json_annotation/json_annotation.dart';

part 'detailPosition.g.dart';

@JsonSerializable()
class DetailPosition {
  DetailPosition({
    this.id,
  });

  int? id;
  String? user_id;
  String? position;
  String? salary;
  String? exp;
  String? major;
  String? degree;
  String? qty;
  String? description;
  String? status;
  List<String>? user_job_interestings;

  factory DetailPosition.fromJson(Map<String, dynamic> json) =>
      _$DetailPositionFromJson(json);

  Map<String, dynamic> toJson() => _$DetailPositionToJson(this);
}
