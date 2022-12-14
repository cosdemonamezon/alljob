// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      id: json['id'] as int?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      birthday: json['birthday'] as String?,
      age: json['age'] as String?,
      gender: json['gender'] as String?,
      marital: json['marital'] as String?,
      image: json['image'] as String?,
      status: json['status'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'birthday': instance.birthday,
      'age': instance.age,
      'gender': instance.gender,
      'marital': instance.marital,
      'image': instance.image,
      'status': instance.status,
      'token': instance.token,
    };
