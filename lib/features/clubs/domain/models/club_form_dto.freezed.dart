// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'club_form_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ClubFormDto _$ClubFormDtoFromJson(Map<String, dynamic> json) {
  return _ClubFormDto.fromJson(json);
}

/// @nodoc
mixin _$ClubFormDto {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this ClubFormDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClubFormDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClubFormDtoCopyWith<ClubFormDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubFormDtoCopyWith<$Res> {
  factory $ClubFormDtoCopyWith(
    ClubFormDto value,
    $Res Function(ClubFormDto) then,
  ) = _$ClubFormDtoCopyWithImpl<$Res, ClubFormDto>;
  @useResult
  $Res call({String name, String description});
}

/// @nodoc
class _$ClubFormDtoCopyWithImpl<$Res, $Val extends ClubFormDto>
    implements $ClubFormDtoCopyWith<$Res> {
  _$ClubFormDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClubFormDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? description = null}) {
    return _then(
      _value.copyWith(
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
abstract class _$$ClubFormDtoImplCopyWith<$Res>
    implements $ClubFormDtoCopyWith<$Res> {
  factory _$$ClubFormDtoImplCopyWith(
    _$ClubFormDtoImpl value,
    $Res Function(_$ClubFormDtoImpl) then,
  ) = __$$ClubFormDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String description});
}

/// @nodoc
class __$$ClubFormDtoImplCopyWithImpl<$Res>
    extends _$ClubFormDtoCopyWithImpl<$Res, _$ClubFormDtoImpl>
    implements _$$ClubFormDtoImplCopyWith<$Res> {
  __$$ClubFormDtoImplCopyWithImpl(
    _$ClubFormDtoImpl _value,
    $Res Function(_$ClubFormDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClubFormDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? description = null}) {
    return _then(
      _$ClubFormDtoImpl(
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
class _$ClubFormDtoImpl implements _ClubFormDto {
  const _$ClubFormDtoImpl({required this.name, required this.description});

  factory _$ClubFormDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubFormDtoImplFromJson(json);

  @override
  final String name;
  @override
  final String description;

  @override
  String toString() {
    return 'ClubFormDto(name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubFormDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description);

  /// Create a copy of ClubFormDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubFormDtoImplCopyWith<_$ClubFormDtoImpl> get copyWith =>
      __$$ClubFormDtoImplCopyWithImpl<_$ClubFormDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClubFormDtoImplToJson(this);
  }
}

abstract class _ClubFormDto implements ClubFormDto {
  const factory _ClubFormDto({
    required final String name,
    required final String description,
  }) = _$ClubFormDtoImpl;

  factory _ClubFormDto.fromJson(Map<String, dynamic> json) =
      _$ClubFormDtoImpl.fromJson;

  @override
  String get name;
  @override
  String get description;

  /// Create a copy of ClubFormDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClubFormDtoImplCopyWith<_$ClubFormDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
