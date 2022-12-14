// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Position _$PositionFromJson(Map<String, dynamic> json) => Position(
      id: json['id'] as int?,
      compay: json['compay'] == null
          ? null
          : Compay.fromJson(json['compay'] as Map<String, dynamic>),
      recruitment_companies: (json['recruitment_companies'] as List<dynamic>?)
          ?.map((e) => DetailPosition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PositionToJson(Position instance) => <String, dynamic>{
      'id': instance.id,
      'compay': instance.compay,
      'recruitment_companies': instance.recruitment_companies,
    };
