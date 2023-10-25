import 'package:cosmo_app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  final LoginController loginController = Get.put(LoginController());
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
            onPressed: () async {
              await widget.loginController.signInWithGoogle();
              Get.offAllNamed('/home');
            },
            icon: Icon(Icons.login)),
      ),
    );
  }
}
