// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String get id => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get career => throw _privateConstructorUsedError;
  List<String> get urls => throw _privateConstructorUsedError;
  String get profile => throw _privateConstructorUsedError;
  List<String> get specialties => throw _privateConstructorUsedError;
  List<String> get compatibilities => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {String id,
      bool isPublic,
      String name,
      List<String> career,
      List<String> urls,
      String profile,
      List<String> specialties,
      List<String> compatibilities,
      String imageUrl});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isPublic = null,
    Object? name = null,
    Object? career = null,
    Object? urls = null,
    Object? profile = null,
    Object? specialties = null,
    Object? compatibilities = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      career: null == career
          ? _value.career
          : career // ignore: cast_nullable_to_non_nullable
              as List<String>,
      urls: null == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String,
      specialties: null == specialties
          ? _value.specialties
          : specialties // ignore: cast_nullable_to_non_nullable
              as List<String>,
      compatibilities: null == compatibilities
          ? _value.compatibilities
          : compatibilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool isPublic,
      String name,
      List<String> career,
      List<String> urls,
      String profile,
      List<String> specialties,
      List<String> compatibilities,
      String imageUrl});
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isPublic = null,
    Object? name = null,
    Object? career = null,
    Object? urls = null,
    Object? profile = null,
    Object? specialties = null,
    Object? compatibilities = null,
    Object? imageUrl = null,
  }) {
    return _then(_$UserProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      career: null == career
          ? _value._career
          : career // ignore: cast_nullable_to_non_nullable
              as List<String>,
      urls: null == urls
          ? _value._urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String,
      specialties: null == specialties
          ? _value._specialties
          : specialties // ignore: cast_nullable_to_non_nullable
              as List<String>,
      compatibilities: null == compatibilities
          ? _value._compatibilities
          : compatibilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl(
      {this.id = '',
      this.isPublic = false,
      this.name = '',
      final List<String> career = const [],
      final List<String> urls = const [],
      this.profile = '',
      final List<String> specialties = const [],
      final List<String> compatibilities = const [],
      this.imageUrl = ''})
      : _career = career,
        _urls = urls,
        _specialties = specialties,
        _compatibilities = compatibilities;

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final bool isPublic;
  @override
  @JsonKey()
  final String name;
  final List<String> _career;
  @override
  @JsonKey()
  List<String> get career {
    if (_career is EqualUnmodifiableListView) return _career;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_career);
  }

  final List<String> _urls;
  @override
  @JsonKey()
  List<String> get urls {
    if (_urls is EqualUnmodifiableListView) return _urls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_urls);
  }

  @override
  @JsonKey()
  final String profile;
  final List<String> _specialties;
  @override
  @JsonKey()
  List<String> get specialties {
    if (_specialties is EqualUnmodifiableListView) return _specialties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialties);
  }

  final List<String> _compatibilities;
  @override
  @JsonKey()
  List<String> get compatibilities {
    if (_compatibilities is EqualUnmodifiableListView) return _compatibilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_compatibilities);
  }

  @override
  @JsonKey()
  final String imageUrl;

  @override
  String toString() {
    return 'UserProfile(id: $id, isPublic: $isPublic, name: $name, career: $career, urls: $urls, profile: $profile, specialties: $specialties, compatibilities: $compatibilities, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._career, _career) &&
            const DeepCollectionEquality().equals(other._urls, _urls) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            const DeepCollectionEquality()
                .equals(other._specialties, _specialties) &&
            const DeepCollectionEquality()
                .equals(other._compatibilities, _compatibilities) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isPublic,
      name,
      const DeepCollectionEquality().hash(_career),
      const DeepCollectionEquality().hash(_urls),
      profile,
      const DeepCollectionEquality().hash(_specialties),
      const DeepCollectionEquality().hash(_compatibilities),
      imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {final String id,
      final bool isPublic,
      final String name,
      final List<String> career,
      final List<String> urls,
      final String profile,
      final List<String> specialties,
      final List<String> compatibilities,
      final String imageUrl}) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  String get id;
  @override
  bool get isPublic;
  @override
  String get name;
  @override
  List<String> get career;
  @override
  List<String> get urls;
  @override
  String get profile;
  @override
  List<String> get specialties;
  @override
  List<String> get compatibilities;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
