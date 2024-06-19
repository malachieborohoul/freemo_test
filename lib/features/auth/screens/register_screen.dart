

import 'package:flutter/material.dart';
import 'package:freemo_test/common/widgets/custom_button.dart';
import 'package:freemo_test/constants/color.dart';
import 'package:freemo_test/constants/global.dart';
import 'package:freemo_test/constants/padding.dart';
import 'package:freemo_test/features/auth/widgets/custom_bold_title.dart';
import 'package:freemo_test/features/auth/widgets/custom_regular_title.dart';
import 'package:freemo_test/features/auth/widgets/custom_textfield.dart';

enum Auth { register, login }

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  final _registerFormKey = GlobalKey<FormState>();

  bool isLoading = false;

  void registerUser() {
  
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
            appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 0,
      ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.appPadding),
            child: SizedBox(
              height: size.height,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRegularTitle(
                          title: "Welcome",
                          family: playfair,
                          size: 20,
                          color: AppColors.background,
                        ),
                        CustomBoldTitle(title: "Business Lounge"),
                        SizedBox(
                          height: AppPadding.miniSpacer,
                        ),
                     
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: size.height * .1,
                    child: Form(
                      key: _registerFormKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: AppPadding.smallSpacer,
                          ),
                        
                          CustomTextfield(
                            controller: phoneController,
                            hintText: "Phone",
                            textInputType: TextInputType.phone,
                            codeKey: 3,
                          ),
                          const SizedBox(
                            height: AppPadding.miniSpacer,
                          ),
                          CustomTextfield(
                            controller: passwordController,
                            hintText: "Password",
                            isPassword: true,
                            codeKey: 4,
                          ),
                          const SizedBox(
                            height: AppPadding.miniSpacer,
                          ),
                          CustomTextfield(
                            password: passwordController.text,
                            controller: cpasswordController,
                            hintText:
                                "Confirm Password",
                            isPassword: true,
                            codeKey: 5,
                          ),
                          const SizedBox(
                            height: AppPadding.miniSpacer,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_registerFormKey.currentState!.validate()) {
                                registerUser();
                                setState(() {
                                  isLoading = true;
                                });
                                // Navigator.pushNamed(
                                //     context, VerificationScreen.routeName);
                              }
                            },
                            child: isLoading
                                ? const CustomButton(
                                    isLoading: true,
                                  )
                                : const CustomButton(
                                    text:
                                        "Register",
                                  ),
                          ),
                          const SizedBox(
                            height: AppPadding.miniSpacer,
                          ),
                        ],
                      ),
                    ),
                  ),
                 
                
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}