// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserProfileListState {
  List<UserProfile> get userProfiles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserProfileListStateCopyWith<UserProfileListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileListStateCopyWith<$Res> {
  factory $UserProfileListStateCopyWith(UserProfileListState value,
          $Res Function(UserProfileListState) then) =
      _$UserProfileListStateCopyWithImpl<$Res, UserProfileListState>;
  @useResult
  $Res call({List<UserProfile> userProfiles});
}

/// @nodoc
class _$UserProfileListStateCopyWithImpl<$Res,
        $Val extends UserProfileListState>
    implements $UserProfileListStateCopyWith<$Res> {
  _$UserProfileListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfiles = null,
  }) {
    return _then(_value.copyWith(
      userProfiles: null == userProfiles
          ? _value.userProfiles
          : userProfiles // ignore: cast_nullable_to_non_nullable
              as List<UserProfile>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileListStateImplCopyWith<$Res>
    implements $UserProfileListStateCopyWith<$Res> {
  factory _$$UserProfileListStateImplCopyWith(_$UserProfileListStateImpl value,
          $Res Function(_$UserProfileListStateImpl) then) =
      __$$UserProfileListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserProfile> userProfiles});
}

/// @nodoc
class __$$UserProfileListStateImplCopyWithImpl<$Res>
    extends _$UserProfileListStateCopyWithImpl<$Res, _$UserProfileListStateImpl>
    implements _$$UserProfileListStateImplCopyWith<$Res> {
  __$$UserProfileListStateImplCopyWithImpl(_$UserProfileListStateImpl _value,
      $Res Function(_$UserProfileListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfiles = null,
  }) {
    return _then(_$UserProfileListStateImpl(
      userProfiles: null == userProfiles
          ? _value._userProfiles
          : userProfiles // ignore: cast_nullable_to_non_nullable
              as List<UserProfile>,
    ));
  }
}

/// @nodoc

class _$UserProfileListStateImpl implements _UserProfileListState {
  _$UserProfileListStateImpl({final List<UserProfile> userProfiles = const []})
      : _userProfiles = userProfiles;

  final List<UserProfile> _userProfiles;
  @override
  @JsonKey()
  List<UserProfile> get userProfiles {
    if (_userProfiles is EqualUnmodifiableListView) return _userProfiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userProfiles);
  }

  @override
  String toString() {
    return 'UserProfileListState(userProfiles: $userProfiles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._userProfiles, _userProfiles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_userProfiles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileListStateImplCopyWith<_$UserProfileListStateImpl>
      get copyWith =>
          __$$UserProfileListStateImplCopyWithImpl<_$UserProfileListStateImpl>(
              this, _$identity);
}

abstract class _UserProfileListState implements UserProfileListState {
  factory _UserProfileListState({final List<UserProfile> userProfiles}) =
      _$UserProfileListStateImpl;

  @override
  List<UserProfile> get userProfiles;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileListStateImplCopyWith<_$UserProfileListStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
