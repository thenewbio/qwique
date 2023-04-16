import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qwique/screens/bottomnavigation/bottom_navigation_screen.dart';
import 'package:qwique/screens/components/loading/loading_screen.dart';
import 'package:qwique/screens/home_page.dart';
import 'package:qwique/screens/home_screen.dart';
import 'package:qwique/screens/login/login_screen.dart';
import 'package:qwique/screens/onboarding/onboarding_screen.dart';
import 'package:qwique/screens/signup/sign_up_screen.dart';
import 'package:qwique/state/auth/providers/auth_state_provider.dart';
import 'package:qwique/state/auth/providers/is_logged_in_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return MaterialApp(
      darkTheme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blueGrey,
          indicatorColor: Colors.blueGrey),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: 'Qwique',
      home: authState.when(
        data: (user) {
          if (user != null) return const BottomNavigation();
          return const LoginScreen();
        },
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
