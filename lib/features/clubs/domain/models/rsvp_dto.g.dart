// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rsvp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RsvpDtoImpl _$$RsvpDtoImplFromJson(Map<String, dynamic> json) =>
    _$RsvpDtoImpl(
      userId: (json['userId'] as num).toInt(),
      userName: json['userName'] as String,
      status: json['status'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$RsvpDtoImplToJson(_$RsvpDtoImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'status': instance.status,
      'updatedAt': instance.updatedAt,
    };
