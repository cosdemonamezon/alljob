// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userDetailJob.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailJob _$UserDetailJobFromJson(Map<String, dynamic> json) =>
    UserDetailJob(
      id: json['id'] as int?,
      user_job_id: json['user_job_id'] as String?,
      location_of_educate: json['location_of_educate'] as String?,
      major: json['major'] as String?,
      degree: json['degree'] as String?,
      grade: json['grade'] as String?,
      finished: json['finished'] as String?,
      thai: json['thai'] as String?,
      english: json['english'] as String?,
      china: json['china'] as String?,
      japan: json['japan'] as String?,
      exp: json['exp'] as String?,
      position: json['position'] as String?,
      salary: json['salary'] as String?,
      remark: json['remark'] as String?,
    );

Map<String, dynamic> _$UserDetailJobToJson(UserDetailJob instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_job_id': instance.user_job_id,
      'location_of_educate': instance.location_of_educate,
      'major': instance.major,
      'degree': instance.degree,
      'grade': instance.grade,
      'finished': instance.finished,
      'thai': instance.thai,
      'english': instance.english,
      'china': instance.china,
      'japan': instance.japan,
      'exp': instance.exp,
      'position': instance.position,
      'salary': instance.salary,
      'remark': instance.remark,
    };
