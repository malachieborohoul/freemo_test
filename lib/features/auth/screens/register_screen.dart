import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freemo_test/common/widgets/custom_button.dart';
import 'package:freemo_test/constants/color.dart';
import 'package:freemo_test/constants/global.dart';
import 'package:freemo_test/constants/padding.dart';
import 'package:freemo_test/constants/utils.dart';
import 'package:freemo_test/features/auth/screens/login_screen.dart';
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

  void registerUser() {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.background,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Skip",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.chevron_right_outlined,
                        color: AppColors.primary,
                        size: AppPadding.miniSpacer * 2,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: AppPadding.smallSpacer,
                  ),
                  SvgPicture.asset(
                    "${assetImg}logo.svg",
                    height: AppPadding.spacer - 2,
                    width: AppPadding.spacer - 2,
                  ),
                  const SizedBox(
                    height: AppPadding.spacer,
                  ),
                  const CustomRegularTitle(
                    title: "Register",
                    family: sourceSans,
                    size: AppPadding.smallSpacer,
                    color: AppColors.onBackground,
                  ),
                  const SizedBox(
                    height: AppPadding.miniSpacer,
                  ),
                  const CustomRegularTitle(
                    title: "Create an account",
                    family: sourceSans,
                    size: AppPadding.miniSpacer + 2,
                    color: AppColors.gray,
                    weight: FontWeight.normal,
                  ),
                  const SizedBox(
                    height: AppPadding.smallSpacer,
                  ),
                
                  Form(
                    key: _registerFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                          const CustomRegularTitle(
                    title: "Mobile No",
                    size: AppPadding.miniSpacer + 5,
                  ),
                  const SizedBox(
                    height: AppPadding.miniSpacer - 5,
                  ),
                  Container(
                    height: AppPadding.appPadding+30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.defaultBorder),
                    ),
                    child: Row(children: [
                      Container(
                        height: double.infinity,
                         decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),

                      color: AppColors.defaultBorder.withOpacity(0.4)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(AppPadding.miniSpacer-5),
                      child: Row(children: [
                        Icon(Icons.flag),
                        Icon(Icons.keyboard_arrow_down_outlined)
                      ],),
                    ),
                    
                      ),
                      const SizedBox(
                          width: AppPadding.miniSpacer,
                        ),
                      const Text("+237")
                    ],),
                  ),
                   const SizedBox(
                          height: AppPadding.smallSpacer,
                        ),
                        const CustomRegularTitle(
                          title: "Password",
                          size: AppPadding.miniSpacer + 5,
                        ),
                        const SizedBox(
                          height: AppPadding.miniSpacer - 5,
                        ),
                        CustomTextfield(
                          controller: passwordController,
                          hintText: "Enter your password",
                          isPassword: true,
                          codeKey: 4,
                        ),
                        const SizedBox(
                          height: AppPadding.smallSpacer,
                        ),
                        const CustomRegularTitle(
                          title: "Confirm Password",
                          size: AppPadding.miniSpacer + 5,
                        ),
                        const SizedBox(
                          height: AppPadding.miniSpacer - 5,
                        ),
                        CustomTextfield(
                          password: passwordController.text,
                          controller: cpasswordController,
                          hintText: "Confirm your password",
                          isPassword: true,
                          codeKey: 5,
                        ),
                        const SizedBox(
                          height: AppPadding.smallSpacer,
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
                                  text: "Register",
                                ),
                        ),
                        const SizedBox(
                          height: AppPadding.miniSpacer,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CustomRegularTitle(
                              title: "Already have an account, ",
                              family: sourceSans,
                              size: AppPadding.miniSpacer + 5,
                              color: AppColors.onBackground,
                              weight: FontWeight.w600,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, LoginScreen.routeName);
                              },
                              child: const Text(
                                "Sign in",
                                style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: AppPadding.miniSpacer + 5,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        )),
      ),
    );
  }
}
