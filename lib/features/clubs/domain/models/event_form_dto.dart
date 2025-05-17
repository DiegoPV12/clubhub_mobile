// lib/features/events/domain/models/event_form_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'event_form_dto.freezed.dart';
part 'event_form_dto.g.dart';

@freezed
class EventFormDto with _$EventFormDto {
  const factory EventFormDto({
    required String title,
    required String description,
    required String dateTime, // ISO-8601
    required String location,
  }) = _EventFormDto;

  factory EventFormDto.fromJson(Map<String, dynamic> json) =>
      _$EventFormDtoFromJson(json);
}
