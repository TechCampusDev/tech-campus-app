import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:tcapp/models/event/event.dart';
import 'package:tcapp/services/fire_event_service.dart';

part 'event_page_provider.freezed.dart';

@freezed
class EventPageState with _$EventPageState {
  factory EventPageState({
    Event? event,
  }) = _EventPageState;
}

final eventPageProvider =
    StateNotifierProvider.autoDispose<EventPageController, EventPageState>(
  (ref) => throw UnimplementedError(),
);

class EventPageController extends StateNotifier<EventPageState> {
  EventPageController({required String eventId})
      : _eventId = eventId,
        super(EventPageState()) {
    _init();
  }

  final String _eventId;

  void _init() {
    fetchEvent();
  }

  Future<void> fetchEvent() async {
    final event = await FireEventService().fetchEvent(eventId: _eventId);
    state = state.copyWith(event: event);
  }
}
