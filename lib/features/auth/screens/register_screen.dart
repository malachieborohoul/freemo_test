import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freemo_test/common/widgets/custom_button.dart';
import 'package:freemo_test/constants/color.dart';
import 'package:freemo_test/constants/global.dart';
import 'package:freemo_test/constants/padding.dart';
import 'package:freemo_test/constants/utils.dart';
import 'package:freemo_test/features/auth/screens/login_screen.dart';
import 'package:freemo_test/common/widgets/custom_regular_title.dart';
import 'package:freemo_test/features/auth/screens/search_countries_sreen.dart';
import 'package:freemo_test/features/auth/widgets/custom_textfield.dart';
import 'package:freemo_test/features/dashboard/screens/dashboard_screen.dart';
import 'package:freemo_test/models/country.dart';

enum Auth { register, login }

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();

  Color phoneBorderColor = AppColors.defaultBorder;
  Color selectCountryColor = AppColors.defaultBorder;

  final _registerFormKey = GlobalKey<FormState>();

  bool isLoading = false;

  void registerUser() {
    isLoading = false;
    Navigator.pushNamed(context, DashboardScreen.routeName);
  }

  Country selectedCountry = Country(
      name: "", abbreviation: "", flag: "", phoneCode: "", maxPhoneLength: 0);
  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    cpasswordController.dispose();
    super.dispose();
  }

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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        DashboardScreen.routeName,
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Skip",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_outlined,
                          color: AppColors.primary,
                          size: AppPadding.miniSpacer * 2,
                        ),
                      ],
                    ),
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
                        Row(
                          children: [
                            Container(
                              height: AppPadding.appPadding + 38,
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                border: Border(
                                    top: BorderSide(
                                        color: selectCountryColor),
                                    left: BorderSide(
                                        color: selectCountryColor),
                                    bottom: BorderSide(
                                        color: selectCountryColor)),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                      color: AppColors.defaultBorder
                                          .withOpacity(0.4),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                          AppPadding.miniSpacer - 5),
                                      child: GestureDetector(
                                        onTap: () async {
                                          var country =
                                              await Navigator.pushNamed(
                                                  context,
                                                  SearchCountriesSreen
                                                      .routeName);

                                          if (country != null &&
                                              country is Country) {
                                            selectedCountry = country;

                                            setState(() {
                              selectCountryColor = AppColors.defaultBorder;

                                            });
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            selectedCountry.name.isNotEmpty
                                                ? Text(
                                                    selectedCountry.flag,
                                                    style: const TextStyle(
                                                        fontSize: AppPadding
                                                                .miniSpacer +
                                                            8),
                                                  )
                                                : const SizedBox(
                                                    width:
                                                        AppPadding.miniSpacer,
                                                  ),
                                            const Icon(
                                              Icons
                                                  .keyboard_arrow_down_outlined,
                                              size: AppPadding.miniSpacer + 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: AppPadding.miniSpacer,
                                  ),
                                  Text(selectedCountry.name.isNotEmpty
                                      ? selectedCountry.phoneCode
                                      : "+"),
                                  const SizedBox(
                                    width: AppPadding.miniSpacer,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: phoneBorderColor),
                                    bottom: BorderSide(color: phoneBorderColor),
                                    right: BorderSide(color: phoneBorderColor),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                ),
                                child: TextField(
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      setState(() {
                                        phoneBorderColor = AppColors.primary;
                                      });
                                    } else {
                                      setState(() {
                                        phoneBorderColor =
                                            AppColors.defaultBorder;
                                      });
                                    }
                                  },
                                  keyboardType: TextInputType.phone,
                                  controller: phoneController,
                                  decoration: const InputDecoration(
                                    hintText: "0000 0000",
                                    hintStyle: TextStyle(
                                        color: AppColors.defaultBorder,
                                        fontSize: AppPadding.miniSpacer + 5),

                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 16),
                                    border: InputBorder
                                        .none, // Supprime la bordure par défaut du TextField
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                          isPrefix: true,
                          controller: passwordController,
                          hintText: "Enter your password",
                          isPassword: true,
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
                          isPrefix: true,
                          password: passwordController.text,
                          controller: cpasswordController,
                          hintText: "Confirm your password",
                          isPassword: true,
                          codeKey: 2,
                        ),
                        const SizedBox(
                          height: AppPadding.smallSpacer,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_registerFormKey.currentState!.validate() &&
                                phoneController.text.isNotEmpty &&
                                selectedCountry.name.isNotEmpty) {
                              setState(() {
                                isLoading = true;
                                registerUser();
                              });
                            } else {
                              setState(() {
                              selectCountryColor = AppColors.primary;
                                
                              });
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
                                  context,
                                  DashboardScreen.routeName,
                                );
                              },
                              child: const Text(
                                "Sign in",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: AppPadding.miniSpacer + 5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
