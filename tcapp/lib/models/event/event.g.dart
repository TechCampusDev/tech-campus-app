// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      surveyBeforeUrl: json['surveyBeforeUrl'] as String?,
      surveyBeforeTitle: json['surveyBeforeTitle'] as String? ?? '',
      surveyAfterUrl: json['surveyAfterUrl'] as String?,
      surveyAfterTitle: json['surveyAfterTitle'] as String? ?? '',
      speakerUserIds: (json['speakerUserIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      startTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['startTime'], const FireTimestampConverter().fromJson),
      endTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['endTime'], const FireTimestampConverter().fromJson),
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'surveyBeforeUrl': instance.surveyBeforeUrl,
      'surveyBeforeTitle': instance.surveyBeforeTitle,
      'surveyAfterUrl': instance.surveyAfterUrl,
      'surveyAfterTitle': instance.surveyAfterTitle,
      'speakerUserIds': instance.speakerUserIds,
      'startTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.startTime, const FireTimestampConverter().toJson),
      'endTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.endTime, const FireTimestampConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
