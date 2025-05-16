// lib/features/clubs/domain/models/club_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';
part 'club_dto.freezed.dart';
part 'club_dto.g.dart';

@freezed
class ClubDto with _$ClubDto {
  const factory ClubDto({
    required int id,
    required String name,
    required String description,
  }) = _ClubDto;

  factory ClubDto.fromJson(Map<String, dynamic> json) =>
      _$ClubDtoFromJson(json);
}
