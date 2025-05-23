// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EventDto _$EventDtoFromJson(Map<String, dynamic> json) {
  return _EventDto.fromJson(json);
}

/// @nodoc
mixin _$EventDto {
  int get id => throw _privateConstructorUsedError;
  int get clubId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// ← El backend envía “dateTime”
  String get dateTime => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get myStatus => throw _privateConstructorUsedError;

  /// Serializes this EventDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventDtoCopyWith<EventDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDtoCopyWith<$Res> {
  factory $EventDtoCopyWith(EventDto value, $Res Function(EventDto) then) =
      _$EventDtoCopyWithImpl<$Res, EventDto>;
  @useResult
  $Res call({
    int id,
    int clubId,
    String title,
    String? description,
    String dateTime,
    String? location,
    String? myStatus,
  });
}

/// @nodoc
class _$EventDtoCopyWithImpl<$Res, $Val extends EventDto>
    implements $EventDtoCopyWith<$Res> {
  _$EventDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clubId = null,
    Object? title = null,
    Object? description = freezed,
    Object? dateTime = null,
    Object? location = freezed,
    Object? myStatus = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            clubId:
                null == clubId
                    ? _value.clubId
                    : clubId // ignore: cast_nullable_to_non_nullable
                        as int,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
            dateTime:
                null == dateTime
                    ? _value.dateTime
                    : dateTime // ignore: cast_nullable_to_non_nullable
                        as String,
            location:
                freezed == location
                    ? _value.location
                    : location // ignore: cast_nullable_to_non_nullable
                        as String?,
            myStatus:
                freezed == myStatus
                    ? _value.myStatus
                    : myStatus // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventDtoImplCopyWith<$Res>
    implements $EventDtoCopyWith<$Res> {
  factory _$$EventDtoImplCopyWith(
    _$EventDtoImpl value,
    $Res Function(_$EventDtoImpl) then,
  ) = __$$EventDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int clubId,
    String title,
    String? description,
    String dateTime,
    String? location,
    String? myStatus,
  });
}

/// @nodoc
class __$$EventDtoImplCopyWithImpl<$Res>
    extends _$EventDtoCopyWithImpl<$Res, _$EventDtoImpl>
    implements _$$EventDtoImplCopyWith<$Res> {
  __$$EventDtoImplCopyWithImpl(
    _$EventDtoImpl _value,
    $Res Function(_$EventDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clubId = null,
    Object? title = null,
    Object? description = freezed,
    Object? dateTime = null,
    Object? location = freezed,
    Object? myStatus = freezed,
  }) {
    return _then(
      _$EventDtoImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        clubId:
            null == clubId
                ? _value.clubId
                : clubId // ignore: cast_nullable_to_non_nullable
                    as int,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
        dateTime:
            null == dateTime
                ? _value.dateTime
                : dateTime // ignore: cast_nullable_to_non_nullable
                    as String,
        location:
            freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                    as String?,
        myStatus:
            freezed == myStatus
                ? _value.myStatus
                : myStatus // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EventDtoImpl implements _EventDto {
  const _$EventDtoImpl({
    required this.id,
    required this.clubId,
    required this.title,
    this.description,
    required this.dateTime,
    this.location,
    this.myStatus,
  });

  factory _$EventDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventDtoImplFromJson(json);

  @override
  final int id;
  @override
  final int clubId;
  @override
  final String title;
  @override
  final String? description;

  /// ← El backend envía “dateTime”
  @override
  final String dateTime;
  @override
  final String? location;
  @override
  final String? myStatus;

  @override
  String toString() {
    return 'EventDto(id: $id, clubId: $clubId, title: $title, description: $description, dateTime: $dateTime, location: $location, myStatus: $myStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clubId, clubId) || other.clubId == clubId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.myStatus, myStatus) ||
                other.myStatus == myStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    clubId,
    title,
    description,
    dateTime,
    location,
    myStatus,
  );

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventDtoImplCopyWith<_$EventDtoImpl> get copyWith =>
      __$$EventDtoImplCopyWithImpl<_$EventDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventDtoImplToJson(this);
  }
}

abstract class _EventDto implements EventDto {
  const factory _EventDto({
    required final int id,
    required final int clubId,
    required final String title,
    final String? description,
    required final String dateTime,
    final String? location,
    final String? myStatus,
  }) = _$EventDtoImpl;

  factory _EventDto.fromJson(Map<String, dynamic> json) =
      _$EventDtoImpl.fromJson;

  @override
  int get id;
  @override
  int get clubId;
  @override
  String get title;
  @override
  String? get description;

  /// ← El backend envía “dateTime”
  @override
  String get dateTime;
  @override
  String? get location;
  @override
  String? get myStatus;

  /// Create a copy of EventDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventDtoImplCopyWith<_$EventDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
