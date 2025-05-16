// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rsvp_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RsvpDto _$RsvpDtoFromJson(Map<String, dynamic> json) {
  return _RsvpDto.fromJson(json);
}

/// @nodoc
mixin _$RsvpDto {
  int get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // Going | Maybe | Declined
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this RsvpDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RsvpDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RsvpDtoCopyWith<RsvpDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RsvpDtoCopyWith<$Res> {
  factory $RsvpDtoCopyWith(RsvpDto value, $Res Function(RsvpDto) then) =
      _$RsvpDtoCopyWithImpl<$Res, RsvpDto>;
  @useResult
  $Res call({int userId, String userName, String status, String updatedAt});
}

/// @nodoc
class _$RsvpDtoCopyWithImpl<$Res, $Val extends RsvpDto>
    implements $RsvpDtoCopyWith<$Res> {
  _$RsvpDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RsvpDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? status = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as int,
            userName:
                null == userName
                    ? _value.userName
                    : userName // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RsvpDtoImplCopyWith<$Res> implements $RsvpDtoCopyWith<$Res> {
  factory _$$RsvpDtoImplCopyWith(
    _$RsvpDtoImpl value,
    $Res Function(_$RsvpDtoImpl) then,
  ) = __$$RsvpDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, String userName, String status, String updatedAt});
}

/// @nodoc
class __$$RsvpDtoImplCopyWithImpl<$Res>
    extends _$RsvpDtoCopyWithImpl<$Res, _$RsvpDtoImpl>
    implements _$$RsvpDtoImplCopyWith<$Res> {
  __$$RsvpDtoImplCopyWithImpl(
    _$RsvpDtoImpl _value,
    $Res Function(_$RsvpDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RsvpDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? status = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$RsvpDtoImpl(
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as int,
        userName:
            null == userName
                ? _value.userName
                : userName // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RsvpDtoImpl implements _RsvpDto {
  const _$RsvpDtoImpl({
    required this.userId,
    required this.userName,
    required this.status,
    required this.updatedAt,
  });

  factory _$RsvpDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RsvpDtoImplFromJson(json);

  @override
  final int userId;
  @override
  final String userName;
  @override
  final String status;
  // Going | Maybe | Declined
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'RsvpDto(userId: $userId, userName: $userName, status: $status, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RsvpDtoImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, userName, status, updatedAt);

  /// Create a copy of RsvpDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RsvpDtoImplCopyWith<_$RsvpDtoImpl> get copyWith =>
      __$$RsvpDtoImplCopyWithImpl<_$RsvpDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RsvpDtoImplToJson(this);
  }
}

abstract class _RsvpDto implements RsvpDto {
  const factory _RsvpDto({
    required final int userId,
    required final String userName,
    required final String status,
    required final String updatedAt,
  }) = _$RsvpDtoImpl;

  factory _RsvpDto.fromJson(Map<String, dynamic> json) = _$RsvpDtoImpl.fromJson;

  @override
  int get userId;
  @override
  String get userName;
  @override
  String get status; // Going | Maybe | Declined
  @override
  String get updatedAt;

  /// Create a copy of RsvpDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RsvpDtoImplCopyWith<_$RsvpDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
