// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      isPublic: json['is_public'] as bool? ?? false,
      name: json['name'] as String? ?? '',
      career: (json['career'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      urls:
          (json['urls'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      profile: json['profile'] as String? ?? '',
      specialties: (json['specialties'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      compatibilities: (json['compatibilities'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      imageUrl: json['image_url'] as String? ?? '',
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'is_public': instance.isPublic,
      'name': instance.name,
      'career': instance.career,
      'urls': instance.urls,
      'profile': instance.profile,
      'specialties': instance.specialties,
      'compatibilities': instance.compatibilities,
      'image_url': instance.imageUrl,
    };
