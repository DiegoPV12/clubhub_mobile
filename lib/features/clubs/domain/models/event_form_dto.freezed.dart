// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_form_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EventFormDto _$EventFormDtoFromJson(Map<String, dynamic> json) {
  return _EventFormDto.fromJson(json);
}

/// @nodoc
mixin _$EventFormDto {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get dateTime => throw _privateConstructorUsedError; // ISO-8601
  String get location => throw _privateConstructorUsedError;

  /// Serializes this EventFormDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventFormDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventFormDtoCopyWith<EventFormDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventFormDtoCopyWith<$Res> {
  factory $EventFormDtoCopyWith(
    EventFormDto value,
    $Res Function(EventFormDto) then,
  ) = _$EventFormDtoCopyWithImpl<$Res, EventFormDto>;
  @useResult
  $Res call({
    String title,
    String description,
    String dateTime,
    String location,
  });
}

/// @nodoc
class _$EventFormDtoCopyWithImpl<$Res, $Val extends EventFormDto>
    implements $EventFormDtoCopyWith<$Res> {
  _$EventFormDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventFormDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? dateTime = null,
    Object? location = null,
  }) {
    return _then(
      _value.copyWith(
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            dateTime:
                null == dateTime
                    ? _value.dateTime
                    : dateTime // ignore: cast_nullable_to_non_nullable
                        as String,
            location:
                null == location
                    ? _value.location
                    : location // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventFormDtoImplCopyWith<$Res>
    implements $EventFormDtoCopyWith<$Res> {
  factory _$$EventFormDtoImplCopyWith(
    _$EventFormDtoImpl value,
    $Res Function(_$EventFormDtoImpl) then,
  ) = __$$EventFormDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String description,
    String dateTime,
    String location,
  });
}

/// @nodoc
class __$$EventFormDtoImplCopyWithImpl<$Res>
    extends _$EventFormDtoCopyWithImpl<$Res, _$EventFormDtoImpl>
    implements _$$EventFormDtoImplCopyWith<$Res> {
  __$$EventFormDtoImplCopyWithImpl(
    _$EventFormDtoImpl _value,
    $Res Function(_$EventFormDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventFormDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? dateTime = null,
    Object? location = null,
  }) {
    return _then(
      _$EventFormDtoImpl(
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        dateTime:
            null == dateTime
                ? _value.dateTime
                : dateTime // ignore: cast_nullable_to_non_nullable
                    as String,
        location:
            null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EventFormDtoImpl implements _EventFormDto {
  const _$EventFormDtoImpl({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.location,
  });

  factory _$EventFormDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventFormDtoImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final String dateTime;
  // ISO-8601
  @override
  final String location;

  @override
  String toString() {
    return 'EventFormDto(title: $title, description: $description, dateTime: $dateTime, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventFormDtoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, description, dateTime, location);

  /// Create a copy of EventFormDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventFormDtoImplCopyWith<_$EventFormDtoImpl> get copyWith =>
      __$$EventFormDtoImplCopyWithImpl<_$EventFormDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventFormDtoImplToJson(this);
  }
}

abstract class _EventFormDto implements EventFormDto {
  const factory _EventFormDto({
    required final String title,
    required final String description,
    required final String dateTime,
    required final String location,
  }) = _$EventFormDtoImpl;

  factory _EventFormDto.fromJson(Map<String, dynamic> json) =
      _$EventFormDtoImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String get dateTime; // ISO-8601
  @override
  String get location;

  /// Create a copy of EventFormDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventFormDtoImplCopyWith<_$EventFormDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
