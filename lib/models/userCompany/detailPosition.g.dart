// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailPosition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailPosition _$DetailPositionFromJson(Map<String, dynamic> json) =>
    DetailPosition(
      id: json['id'] as int?,
    )
      ..user_id = json['user_id'] as String?
      ..position = json['position'] as String?
      ..salary = json['salary'] as String?
      ..exp = json['exp'] as String?
      ..major = json['major'] as String?
      ..degree = json['degree'] as String?
      ..qty = json['qty'] as String?
      ..description = json['description'] as String?
      ..status = json['status'] as String?
      ..user_job_interestings =
          (json['user_job_interestings'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList();

Map<String, dynamic> _$DetailPositionToJson(DetailPosition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'position': instance.position,
      'salary': instance.salary,
      'exp': instance.exp,
      'major': instance.major,
      'degree': instance.degree,
      'qty': instance.qty,
      'description': instance.description,
      'status': instance.status,
      'user_job_interestings': instance.user_job_interestings,
    };
