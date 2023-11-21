// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_page_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EventPageState {
  Event? get event => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventPageStateCopyWith<EventPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventPageStateCopyWith<$Res> {
  factory $EventPageStateCopyWith(
          EventPageState value, $Res Function(EventPageState) then) =
      _$EventPageStateCopyWithImpl<$Res, EventPageState>;
  @useResult
  $Res call({Event? event});

  $EventCopyWith<$Res>? get event;
}

/// @nodoc
class _$EventPageStateCopyWithImpl<$Res, $Val extends EventPageState>
    implements $EventPageStateCopyWith<$Res> {
  _$EventPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = freezed,
  }) {
    return _then(_value.copyWith(
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Event?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EventCopyWith<$Res>? get event {
    if (_value.event == null) {
      return null;
    }

    return $EventCopyWith<$Res>(_value.event!, (value) {
      return _then(_value.copyWith(event: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventPageStateImplCopyWith<$Res>
    implements $EventPageStateCopyWith<$Res> {
  factory _$$EventPageStateImplCopyWith(_$EventPageStateImpl value,
          $Res Function(_$EventPageStateImpl) then) =
      __$$EventPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Event? event});

  @override
  $EventCopyWith<$Res>? get event;
}

/// @nodoc
class __$$EventPageStateImplCopyWithImpl<$Res>
    extends _$EventPageStateCopyWithImpl<$Res, _$EventPageStateImpl>
    implements _$$EventPageStateImplCopyWith<$Res> {
  __$$EventPageStateImplCopyWithImpl(
      _$EventPageStateImpl _value, $Res Function(_$EventPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = freezed,
  }) {
    return _then(_$EventPageStateImpl(
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Event?,
    ));
  }
}

/// @nodoc

class _$EventPageStateImpl implements _EventPageState {
  _$EventPageStateImpl({this.event});

  @override
  final Event? event;

  @override
  String toString() {
    return 'EventPageState(event: $event)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventPageStateImpl &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventPageStateImplCopyWith<_$EventPageStateImpl> get copyWith =>
      __$$EventPageStateImplCopyWithImpl<_$EventPageStateImpl>(
          this, _$identity);
}

abstract class _EventPageState implements EventPageState {
  factory _EventPageState({final Event? event}) = _$EventPageStateImpl;

  @override
  Event? get event;
  @override
  @JsonKey(ignore: true)
  _$$EventPageStateImplCopyWith<_$EventPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
