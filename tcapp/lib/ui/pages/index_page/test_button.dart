import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tcapp/models/user_profile.dart';

// TODO(osm-y): remove this widget
class TestButton extends StatelessWidget {
  const TestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: const Text('Test'));
  }

  Future<void> onPressed() async {
    final snapshots = await FirebaseFirestore.instance
        .collection('userProfiles')
        .doc('v1')
        .collection('private')
        .get();
    final users =
        snapshots.docs.map((e) => UserProfile.fromJson(e.data())).toList();
    for (final user in users) {
      await FirebaseFirestore.instance
          .collection('userProfiles')
          .doc('v1')
          .collection('protected')
          .doc(user.id)
          .set(user.toJson());
    }
  }
}
