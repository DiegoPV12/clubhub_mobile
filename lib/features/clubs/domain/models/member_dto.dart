import 'package:freezed_annotation/freezed_annotation.dart';
part 'member_dto.freezed.dart';
part 'member_dto.g.dart';

@freezed
class MemberDto with _$MemberDto {
  const factory MemberDto({
    required int userId, // ← mismo nombre que en la respuesta
    required String userName,
    String? email, // (aún no lo envía el backend)
    required String joinedOn,
  }) = _MemberDto;

  factory MemberDto.fromJson(Map<String, dynamic> json) =>
      _$MemberDtoFromJson(json);
}
