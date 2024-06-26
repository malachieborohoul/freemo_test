import 'package:flutter/material.dart';

enum Auth { register, login }

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  bool isLoading = false;
  void loginUser() {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container();
  }
}
