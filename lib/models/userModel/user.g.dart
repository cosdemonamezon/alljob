// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
      address: json['address'] as String?,
      birthday: json['birthday'] as String?,
      age: json['age'] as String?,
      gender: json['gender'] as String?,
      marital: json['marital'] as String?,
      meetings: (json['meetings'] as List<dynamic>?)
          ?.map((e) => Meetings.fromJson(e as Map<String, dynamic>))
          .toList(),
      user_job_detail: (json['user_job_detail'] as List<dynamic>?)
          ?.map((e) => UserDetailJob.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'image': instance.image,
      'address': instance.address,
      'birthday': instance.birthday,
      'age': instance.age,
      'gender': instance.gender,
      'marital': instance.marital,
      'meetings': instance.meetings,
      'user_job_detail': instance.user_job_detail,
    };
