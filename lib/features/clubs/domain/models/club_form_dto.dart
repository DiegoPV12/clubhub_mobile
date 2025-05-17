// lib/features/clubs/domain/models/club_form_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'club_form_dto.freezed.dart';
part 'club_form_dto.g.dart';

@freezed
class ClubFormDto with _$ClubFormDto {
  const factory ClubFormDto({
    required String name,
    required String description,
  }) = _ClubFormDto;

  factory ClubFormDto.fromJson(Map<String, dynamic> json) =>
      _$ClubFormDtoFromJson(json);
}
