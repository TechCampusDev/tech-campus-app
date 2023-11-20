import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'auth_provider.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    String? uid,
  }) = _AuthState;
  const AuthState._();

  bool get isSignedIn => uid != null;
}

final authProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController();
});

class AuthController extends StateNotifier<AuthState> {
  AuthController() : super(AuthState()) {
    _init();
  }

  void _init() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    state = state.copyWith(uid: user.uid);
  }

  Future<void> signin(String code, String? from) async {
    final functions = FirebaseFunctions.instanceFor(region: 'asia-northeast1');
    final result = await functions
        .httpsCallable('onCallSlackOauth')
        .call<Map<String, String>>({
      'code': code,
      'from': from,
    });
    final customToken = result.data['customToken']!;

    final userCredential =
        await FirebaseAuth.instance.signInWithCustomToken(customToken);
    final uid = userCredential.user!.uid;
    state = state.copyWith(uid: uid);
  }

  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
    state = state.copyWith(uid: null);
  }
}
