// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meetings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meetings _$MeetingsFromJson(Map<String, dynamic> json) => Meetings(
      id: json['id'] as int?,
      user_id: json['user_id'] as String?,
      user_job_id: json['user_job_id'] as String?,
      recruitment_companie_id: json['recruitment_companie_id'] as String?,
      uuid: json['uuid'] as String?,
      host_id: json['host_id'] as String?,
      start_url: json['start_url'] as String?,
      topic: json['topic'] as String?,
      type: json['type'] as String?,
      start_time: json['start_time'] as String?,
      duration: json['duration'] as String?,
      agenda: json['agenda'] as String?,
      join_url: json['join_url'] as String?,
      status: json['status'] as String?,
      isAccept: json['isAccept'] as bool?,
    );

Map<String, dynamic> _$MeetingsToJson(Meetings instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'user_job_id': instance.user_job_id,
      'recruitment_companie_id': instance.recruitment_companie_id,
      'uuid': instance.uuid,
      'host_id': instance.host_id,
      'start_url': instance.start_url,
      'topic': instance.topic,
      'type': instance.type,
      'start_time': instance.start_time,
      'duration': instance.duration,
      'agenda': instance.agenda,
      'join_url': instance.join_url,
      'status': instance.status,
      'isAccept': instance.isAccept,
    };
