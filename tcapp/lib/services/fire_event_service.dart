import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcapp/models/event/event.dart';

class FireEventService {
  final _fireStore = FirebaseFirestore.instance;

  Future<Event> fetchEvent({required String eventId}) async {
    final snapshots = await _fireStore
        .collection('events')
        .doc('v1')
        .collection('public')
        .doc(eventId)
        .get();
    final event = Event.fromJson(snapshots.data()!);
    return event;
  }
}
