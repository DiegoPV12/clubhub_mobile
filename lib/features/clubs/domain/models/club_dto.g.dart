// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClubDtoImpl _$$ClubDtoImplFromJson(Map<String, dynamic> json) =>
    _$ClubDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      ownerId: (json['ownerId'] as num).toInt(),
    );

Map<String, dynamic> _$$ClubDtoImplToJson(_$ClubDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'ownerId': instance.ownerId,
    };
