import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qwique/screens/bottomnavigation/bottom_navigation_screen.dart';
import 'package:qwique/screens/login/login_screen.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, _) {
      final auth = ref.read(authenticationProvider.notifier);

      Future<void> signUp() async {
        setState(() {
          isLoading = true;
        });

        auth.signUp(context, nameController.text, emailController.text,
            passwordController.text);
      }

      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
            child: Form(
              key: _formKey,
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
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 5),
                    child: TextFormField(
                      controller: nameController,
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
                        hintText: "Name",
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
                      'Email',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 5),
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
                    padding: const EdgeInsets.only(bottom: 20, top: 5),
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
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                      text: 'I agree with ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: 'Terms',
                      style: TextStyle(
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.w700),
                    ),
                    const TextSpan(
                      text: 'and ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy',
                      style: TextStyle(
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.w700),
                    ),
                  ])),
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : GeneralButton(
                          text: 'Sign up',
                          onpressed: () {
                            if (_formKey.currentState!.validate()) {
                              signUp();
                            }
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
                            builder: (_) => const LoginScreen()));
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
          ),
        ),
      );
    });
  }
}
