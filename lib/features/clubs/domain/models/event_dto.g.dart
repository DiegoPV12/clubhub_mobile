// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventDtoImpl _$$EventDtoImplFromJson(Map<String, dynamic> json) =>
    _$EventDtoImpl(
      id: (json['id'] as num).toInt(),
      clubId: (json['clubId'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      dateIso: json['dateTime'] as String,
      location: json['location'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$EventDtoImplToJson(_$EventDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clubId': instance.clubId,
      'title': instance.title,
      'description': instance.description,
      'dateTime': instance.dateIso,
      'location': instance.location,
      'createdAt': instance.createdAt,
    };
