import 'package:enquiry_form_android/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:line_icons/line_icon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void changeVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (input) =>
                    input!.isValidEmail() ? null : "Invalid Email",
                decoration: const InputDecoration(
                  prefixIcon: LineIcon.user(),
                  border: OutlineInputBorder(),
                  label: Text("Email Address"),
                ),
              ),
              const Gap(10),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: !_isVisible,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: const LineIcon.lock(),
                  suffixIcon: IconButton(
                    onPressed: changeVisibility,
                    icon: _isVisible
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  label: const Text("Password"),
                ),
              ),
              const Gap(10),
              ElevatedButton(
                onPressed: () {
                  if (emailController.text.isValidEmail() &&
                      passwordController.text.isNotEmpty) {
                    LoginService().login(
                      email: emailController.text,
                      password: passwordController.text,
                      context: context,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Invalid Email or Password"),
                        showCloseIcon: true,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor:
                        Theme.of(context).colorScheme.inversePrimary),
                child: const Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
