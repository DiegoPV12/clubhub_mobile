import 'package:freezed_annotation/freezed_annotation.dart';
part 'event_dto.freezed.dart';
part 'event_dto.g.dart';

@freezed
class EventDto with _$EventDto {
  const factory EventDto({
    required int id,
    required int clubId,
    required String title,
    String? description, // ← opcional
    required String dateIso,
    String? location, // ← opcional
    String? createdAt,
  }) = _EventDto;

  factory EventDto.fromJson(Map<String, dynamic> json) =>
      _$EventDtoFromJson(json);
}
