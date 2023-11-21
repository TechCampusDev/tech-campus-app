import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tcapp/models/user_profile/user_profile.dart';

class FireUserProfileService {
  final _fireStore = FirebaseFirestore.instance;

  Future<List<UserProfile>> fetchAllMembers({required bool isSignedIn}) async {
    final snapshots = await _fireStore
        .collection('userProfiles')
        .doc('v1')
        .collection(isSignedIn ? 'protected' : 'public')
        .get();
    final userProfiles =
        snapshots.docs.map((e) => UserProfile.fromJson(e.data())).toList();
    return userProfiles;
  }

  Future<UserProfile> fetchUserProfile({
    required bool isSignedIn,
    required String userId,
  }) async {
    final snapshot = await _fireStore
        .collection('userProfiles')
        .doc('v1')
        .collection(isSignedIn ? 'protected' : 'public')
        .doc(userId)
        .get();
    final userProfile = UserProfile.fromJson(snapshot.data()!);
    return userProfile;
  }
}
