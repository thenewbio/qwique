import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qwique/screens/bottomnavigation/bottom_navigation_screen.dart';
import 'package:qwique/screens/components/loading/loading_screen.dart';
import 'package:qwique/screens/login/login_screen.dart';
import 'package:qwique/screens/onboarding/onboarding_screen.dart';
import 'package:qwique/state/auth/providers/is_logged_in_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(
    BuildContext context,
  ) {
    // final authState = ref.watch(authenticationProvider.notifier);
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
      home: Consumer(builder: (context, ref, child) {
        ref.listen<bool>(isLoggedInProvider, (_, isLoading) {
          if (isLoading) {
            LoadingScreen.instance().show(
              context: context,
            );
          } else {
            LoadingScreen.instance().hide();
          }
        });
        final isLoggedIn = ref.watch(isLoggedInProvider);
        // isLoggedIn.log();

        if (isLoggedIn) {
          return const BottomNavigation();
        } else {
          return const OnboardingScreen();
        }
      }),
    );
  }
}
