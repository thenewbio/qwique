import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qwique/state/auth/backend/authenticator.dart';
import 'package:qwique/state/auth/model/auth_state.dart';
import 'package:qwique/state/auth/notifiers/auth_state_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';

// final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
//   (_) => AuthStateNotifier(),
// );
final authenticationProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier();
});
// final authStateProvider = StreamProvider<User?>((ref) {
//   return ref.read(authenticationProvider);
// });
