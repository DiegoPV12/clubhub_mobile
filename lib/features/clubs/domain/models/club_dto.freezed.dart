// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'club_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ClubDto _$ClubDtoFromJson(Map<String, dynamic> json) {
  return _ClubDto.fromJson(json);
}

/// @nodoc
mixin _$ClubDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this ClubDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClubDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClubDtoCopyWith<ClubDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubDtoCopyWith<$Res> {
  factory $ClubDtoCopyWith(ClubDto value, $Res Function(ClubDto) then) =
      _$ClubDtoCopyWithImpl<$Res, ClubDto>;
  @useResult
  $Res call({int id, String name, String description});
}

/// @nodoc
class _$ClubDtoCopyWithImpl<$Res, $Val extends ClubDto>
    implements $ClubDtoCopyWith<$Res> {
  _$ClubDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClubDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClubDtoImplCopyWith<$Res> implements $ClubDtoCopyWith<$Res> {
  factory _$$ClubDtoImplCopyWith(
    _$ClubDtoImpl value,
    $Res Function(_$ClubDtoImpl) then,
  ) = __$$ClubDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String description});
}

/// @nodoc
class __$$ClubDtoImplCopyWithImpl<$Res>
    extends _$ClubDtoCopyWithImpl<$Res, _$ClubDtoImpl>
    implements _$$ClubDtoImplCopyWith<$Res> {
  __$$ClubDtoImplCopyWithImpl(
    _$ClubDtoImpl _value,
    $Res Function(_$ClubDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClubDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(
      _$ClubDtoImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClubDtoImpl implements _ClubDto {
  const _$ClubDtoImpl({
    required this.id,
    required this.name,
    required this.description,
  });

  factory _$ClubDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;

  @override
  String toString() {
    return 'ClubDto(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  /// Create a copy of ClubDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubDtoImplCopyWith<_$ClubDtoImpl> get copyWith =>
      __$$ClubDtoImplCopyWithImpl<_$ClubDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClubDtoImplToJson(this);
  }
}

abstract class _ClubDto implements ClubDto {
  const factory _ClubDto({
    required final int id,
    required final String name,
    required final String description,
  }) = _$ClubDtoImpl;

  factory _ClubDto.fromJson(Map<String, dynamic> json) = _$ClubDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;

  /// Create a copy of ClubDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClubDtoImplCopyWith<_$ClubDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
