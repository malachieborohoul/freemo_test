import 'package:flutter/material.dart';
import 'package:freemo_test/common/widgets/custom_button.dart';
import 'package:freemo_test/constants/color.dart';
import 'package:freemo_test/constants/global.dart';
import 'package:freemo_test/constants/padding.dart';
import 'package:freemo_test/common/widgets/custom_bold_title.dart';
import 'package:freemo_test/common/widgets/custom_regular_title.dart';
import 'package:freemo_test/features/auth/widgets/custom_textfield.dart';

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
