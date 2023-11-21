import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  @JsonSerializable(explicitToJson: true)
  const factory Event({
    @Default('') String id,
    @Default('') String title,
    @Default([]) List<String> speakerUserIds,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
