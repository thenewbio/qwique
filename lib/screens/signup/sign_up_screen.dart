import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qwique/screens/bottomnavigation/bottom_navigation_screen.dart';
import 'package:qwique/screens/widgets/general_button.dart';
import 'package:qwique/screens/widgets/google_button.dart';
import 'package:qwique/screens/widgets/textField_widget.dart';
import 'package:qwique/state/auth/providers/auth_state_provider.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();
final nameController = TextEditingController();

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, _) {
      final auth = ref.watch(authenticationProvider);

      Future<void> signUp() async {
        setState(() {
          isLoading = true;
        });

        auth.signUp(emailController.text, passwordController.text).whenComplete(
              () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => const BottomNavigation(),
                ),
              ),
            );
      }

      return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GoogleButton(
                onTap: () {},
                text: "Sign up with Google",
              ),
              const SizedBox(
                height: 30,
              ),
              InputTextField(
                controller: nameController,
                hintText: 'Enter your name',
                isEmail: true,
                onchange: () {},
              ),
              InputTextField(
                controller: emailController,
                hintText: 'Enter Email',
                isEmail: true,
                onchange: () {},
              ),
              InputTextField(
                controller: passwordController,
                hintText: 'Your Password',
                onchange: () {},
              ),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GeneralButton(
                      text: 'Sign up',
                      onpressed: () {
                        signUp();
                      }),
              const Text(
                'Already have an account?',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  style: const ButtonStyle(
                      splashFactory: InkSplash.splashFactory,
                      animationDuration: Duration(seconds: 5),
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.only(bottom: 30))),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) => const SignUpScreen()));
                  },
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.blue.shade600,
                      fontSize: 16,
                    ),
                  )),
            ],
          ),
        ),
      );
    });
  }
}
