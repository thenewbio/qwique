import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qwique/screens/bottomnavigation/bottom_navigation_screen.dart';

import 'package:qwique/state/auth/backend/authenticator.dart';
import 'package:qwique/state/auth/model/auth_result.dart';
import 'package:qwique/state/auth/model/auth_state.dart';
import 'package:qwique/state/auth/typedef/user_id.dart';
import 'package:qwique/state/user_info/backend/user_info_storage.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authenticator = Authenticator();
  final _userInfoStorage = const UserInfoStorage();

  AuthStateNotifier() : super(const AuthState.unknown()) {
    if (_authenticator.isAlreadyLoggedIn) {
      state = AuthState(
        result: AuthResult.success,
        isLoading: false,
        userId: _authenticator.userId,
      );
    }
  }

  Future<void> logOut() async {
    state = state.copiedWithIsLoading(true);
    await _authenticator.logout();
    state = const AuthState.unknown();
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    state = state.copiedWithIsLoading(true);
    final result = await _authenticator.loginWithEmail(
      email,
      password,
    );
    final userId = _authenticator.userId;
    if (result == AuthResult.success && userId != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const BottomNavigation()));
    }
    state = AuthState(
      result: result,
      isLoading: false,
      userId: userId,
    );
  }

  Future<void> signUp(
      context, String username, String email, String password) async {
    state = state.copiedWithIsLoading(true);
    final result = await _authenticator.signUp(
      email,
      password,
    );
    final userId = _authenticator.userId;
    if (result == AuthResult.success) {
      await _userInfoStorage.saveUserInfo(
        userId: userId!,
        displayName: username,
        email: email,
      );
    }
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const BottomNavigation()));
    state = AuthState(
      result: result,
      isLoading: false,
      userId: userId,
    );
  }

  Future<void> loginWithGoogle() async {
    state = state.copiedWithIsLoading(true);
    final result = await _authenticator.loginWithGoogle();
    final userId = _authenticator.userId;
    if (result == AuthResult.success && userId != null) {
      await saveUserInfo(userId: userId);
    }
    state = AuthState(
      result: result,
      isLoading: false,
      userId: _authenticator.userId,
    );
  }

  Future<void> saveUserInfo({
    required UserId userId,
  }) =>
      _userInfoStorage.saveUserInfo(
        userId: userId,
        displayName: _authenticator.displayName,
        email: _authenticator.email,
      );
}
