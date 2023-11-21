import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcapp/models/converters.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  @JsonSerializable(explicitToJson: true)
  const factory Event({
    @Default('') String id,
    @Default('') String title,
    @Default('') String description,
    String? surveyBeforeUrl,
    @Default('') String surveyBeforeTitle,
    String? surveyAfterUrl,
    @Default('') String surveyAfterTitle,
    @Default([]) List<String> speakerUserIds,
    @FireTimestampConverter() DateTime? startTime,
    @FireTimestampConverter() DateTime? endTime,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
