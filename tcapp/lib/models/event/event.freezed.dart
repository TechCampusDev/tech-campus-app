// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get surveyBeforeUrl => throw _privateConstructorUsedError;
  String get surveyBeforeTitle => throw _privateConstructorUsedError;
  String? get surveyAfterUrl => throw _privateConstructorUsedError;
  String get surveyAfterTitle => throw _privateConstructorUsedError;
  List<String> get speakerUserIds => throw _privateConstructorUsedError;
  @FireTimestampConverter()
  DateTime? get startTime => throw _privateConstructorUsedError;
  @FireTimestampConverter()
  DateTime? get endTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String? surveyBeforeUrl,
      String surveyBeforeTitle,
      String? surveyAfterUrl,
      String surveyAfterTitle,
      List<String> speakerUserIds,
      @FireTimestampConverter() DateTime? startTime,
      @FireTimestampConverter() DateTime? endTime});
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? surveyBeforeUrl = freezed,
    Object? surveyBeforeTitle = null,
    Object? surveyAfterUrl = freezed,
    Object? surveyAfterTitle = null,
    Object? speakerUserIds = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      surveyBeforeUrl: freezed == surveyBeforeUrl
          ? _value.surveyBeforeUrl
          : surveyBeforeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      surveyBeforeTitle: null == surveyBeforeTitle
          ? _value.surveyBeforeTitle
          : surveyBeforeTitle // ignore: cast_nullable_to_non_nullable
              as String,
      surveyAfterUrl: freezed == surveyAfterUrl
          ? _value.surveyAfterUrl
          : surveyAfterUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      surveyAfterTitle: null == surveyAfterTitle
          ? _value.surveyAfterTitle
          : surveyAfterTitle // ignore: cast_nullable_to_non_nullable
              as String,
      speakerUserIds: null == speakerUserIds
          ? _value.speakerUserIds
          : speakerUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventImplCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$EventImplCopyWith(
          _$EventImpl value, $Res Function(_$EventImpl) then) =
      __$$EventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String? surveyBeforeUrl,
      String surveyBeforeTitle,
      String? surveyAfterUrl,
      String surveyAfterTitle,
      List<String> speakerUserIds,
      @FireTimestampConverter() DateTime? startTime,
      @FireTimestampConverter() DateTime? endTime});
}

/// @nodoc
class __$$EventImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$EventImpl>
    implements _$$EventImplCopyWith<$Res> {
  __$$EventImplCopyWithImpl(
      _$EventImpl _value, $Res Function(_$EventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? surveyBeforeUrl = freezed,
    Object? surveyBeforeTitle = null,
    Object? surveyAfterUrl = freezed,
    Object? surveyAfterTitle = null,
    Object? speakerUserIds = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$EventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      surveyBeforeUrl: freezed == surveyBeforeUrl
          ? _value.surveyBeforeUrl
          : surveyBeforeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      surveyBeforeTitle: null == surveyBeforeTitle
          ? _value.surveyBeforeTitle
          : surveyBeforeTitle // ignore: cast_nullable_to_non_nullable
              as String,
      surveyAfterUrl: freezed == surveyAfterUrl
          ? _value.surveyAfterUrl
          : surveyAfterUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      surveyAfterTitle: null == surveyAfterTitle
          ? _value.surveyAfterTitle
          : surveyAfterTitle // ignore: cast_nullable_to_non_nullable
              as String,
      speakerUserIds: null == speakerUserIds
          ? _value._speakerUserIds
          : speakerUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$EventImpl implements _Event {
  const _$EventImpl(
      {this.id = '',
      this.title = '',
      this.description = '',
      this.surveyBeforeUrl,
      this.surveyBeforeTitle = '',
      this.surveyAfterUrl,
      this.surveyAfterTitle = '',
      final List<String> speakerUserIds = const [],
      @FireTimestampConverter() this.startTime,
      @FireTimestampConverter() this.endTime})
      : _speakerUserIds = speakerUserIds;

  factory _$EventImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  final String? surveyBeforeUrl;
  @override
  @JsonKey()
  final String surveyBeforeTitle;
  @override
  final String? surveyAfterUrl;
  @override
  @JsonKey()
  final String surveyAfterTitle;
  final List<String> _speakerUserIds;
  @override
  @JsonKey()
  List<String> get speakerUserIds {
    if (_speakerUserIds is EqualUnmodifiableListView) return _speakerUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_speakerUserIds);
  }

  @override
  @FireTimestampConverter()
  final DateTime? startTime;
  @override
  @FireTimestampConverter()
  final DateTime? endTime;

  @override
  String toString() {
    return 'Event(id: $id, title: $title, description: $description, surveyBeforeUrl: $surveyBeforeUrl, surveyBeforeTitle: $surveyBeforeTitle, surveyAfterUrl: $surveyAfterUrl, surveyAfterTitle: $surveyAfterTitle, speakerUserIds: $speakerUserIds, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.surveyBeforeUrl, surveyBeforeUrl) ||
                other.surveyBeforeUrl == surveyBeforeUrl) &&
            (identical(other.surveyBeforeTitle, surveyBeforeTitle) ||
                other.surveyBeforeTitle == surveyBeforeTitle) &&
            (identical(other.surveyAfterUrl, surveyAfterUrl) ||
                other.surveyAfterUrl == surveyAfterUrl) &&
            (identical(other.surveyAfterTitle, surveyAfterTitle) ||
                other.surveyAfterTitle == surveyAfterTitle) &&
            const DeepCollectionEquality()
                .equals(other._speakerUserIds, _speakerUserIds) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      surveyBeforeUrl,
      surveyBeforeTitle,
      surveyAfterUrl,
      surveyAfterTitle,
      const DeepCollectionEquality().hash(_speakerUserIds),
      startTime,
      endTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      __$$EventImplCopyWithImpl<_$EventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventImplToJson(
      this,
    );
  }
}

abstract class _Event implements Event {
  const factory _Event(
      {final String id,
      final String title,
      final String description,
      final String? surveyBeforeUrl,
      final String surveyBeforeTitle,
      final String? surveyAfterUrl,
      final String surveyAfterTitle,
      final List<String> speakerUserIds,
      @FireTimestampConverter() final DateTime? startTime,
      @FireTimestampConverter() final DateTime? endTime}) = _$EventImpl;

  factory _Event.fromJson(Map<String, dynamic> json) = _$EventImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String? get surveyBeforeUrl;
  @override
  String get surveyBeforeTitle;
  @override
  String? get surveyAfterUrl;
  @override
  String get surveyAfterTitle;
  @override
  List<String> get speakerUserIds;
  @override
  @FireTimestampConverter()
  DateTime? get startTime;
  @override
  @FireTimestampConverter()
  DateTime? get endTime;
  @override
  @JsonKey(ignore: true)
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
