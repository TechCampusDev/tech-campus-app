import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserProfile({
    @Default(false) bool isPublic,
    @Default('') String name,
    @Default([]) List<String> career,
    @Default([]) List<String> urls,
    @Default('') String profile,
    @Default([]) List<String> specialties,
    @Default([]) List<String> compatibilities,
    @Default('') String imageUrl,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
