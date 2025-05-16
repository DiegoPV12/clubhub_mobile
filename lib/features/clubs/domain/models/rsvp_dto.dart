// lib/features/events/domain/models/rsvp_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'rsvp_dto.freezed.dart';
part 'rsvp_dto.g.dart';

@freezed
class RsvpDto with _$RsvpDto {
  const factory RsvpDto({
    required int userId,
    required String userName,
    required String status, // Going | Maybe | Declined
    required String updatedAt,
  }) = _RsvpDto;

  factory RsvpDto.fromJson(Map<String, dynamic> json) =>
      _$RsvpDtoFromJson(json);
}
