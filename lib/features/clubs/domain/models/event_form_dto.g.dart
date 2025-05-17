// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_form_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventFormDtoImpl _$$EventFormDtoImplFromJson(Map<String, dynamic> json) =>
    _$EventFormDtoImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      dateTime: json['dateTime'] as String,
      location: json['location'] as String,
    );

Map<String, dynamic> _$$EventFormDtoImplToJson(_$EventFormDtoImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'dateTime': instance.dateTime,
      'location': instance.location,
    };
