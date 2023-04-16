import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qwique/screens/bottomnavigation/bottom_navigation_screen.dart';
import 'package:qwique/screens/widgets/general_button.dart';
import 'package:qwique/screens/widgets/google_button.dart';
import 'package:qwique/screens/widgets/textField_widget.dart';
import 'package:qwique/screens/signup/sign_up_screen.dart';
import 'package:qwique/state/auth/providers/auth_state_provider.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, _) {
      final auth = ref.read(authenticationProvider.notifier);
      Future<void> login() async {
        setState(() {
          isLoading = true;
        });
        auth.login(context, emailController.text, passwordController.text);
      }

      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 60, 10, 10),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Log in',
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
                    text: "Log in with Google",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextFormField(
                      controller: emailController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Required";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        hintText: "Email",
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 20),
                    child: TextFormField(
                      controller: passwordController,
                      validator: (val) {
                        if (val!.length < 8) {
                          return "Password must be atleast 8 characters long";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        hintText: "Password",
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : GeneralButton(
                          text: 'Log in',
                          onpressed: () {
                            if (_formKey.currentState!.validate()) {
                              login();
                            }
                          }),
                  TextButton(
                      style: const ButtonStyle(
                          splashFactory: InkSplash.splashFactory,
                          animationDuration: Duration(seconds: 5),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.only(bottom: 30))),
                      onPressed: () {},
                      child: Text(
                        'Forgot password',
                        style: TextStyle(
                          color: Colors.blue.shade600,
                          fontSize: 20,
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Don\'t have an account? ',
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
                        'Sign up',
                        style: TextStyle(
                          color: Colors.blue.shade600,
                          fontSize: 16,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
