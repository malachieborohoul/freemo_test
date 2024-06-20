import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freemo_test/common/widgets/custom_button.dart';
import 'package:freemo_test/constants/color.dart';
import 'package:freemo_test/constants/global.dart';
import 'package:freemo_test/constants/padding.dart';
import 'package:freemo_test/constants/utils.dart';
import 'package:freemo_test/features/auth/screens/login_screen.dart';
import 'package:freemo_test/common/widgets/custom_regular_title.dart';
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
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  TextEditingController searchTermController = TextEditingController();

  final _registerFormKey = GlobalKey<FormState>();

  late Future<List<Country>> countries;
  bool isLoading = false;

  void getAllCountries() {
    countries = countryService.getAllCountries(context);
  }

  void registerUser() {}

  @override
  void initState() {
    getAllCountries();
    super.initState();
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
                          context, DashboardScreen.routeName);
                    },
                    child: const Row(
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
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    color: AppColors.background,
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                          AppPadding.miniSpacer),
                                      child: Column(
                                        children: [
                                          TextField(
                                            style: const TextStyle(
                                                color: AppColors.onBackground,
                                                fontFamily: sourceSans),
                                            //If the entered value is empty, clear the arrays
                                            onChanged: (value) {
                                              if (value.isNotEmpty) {
                                              } else {
                                                setState(() {});
                                              }
                                            },
                                            controller: searchTermController,
                                            keyboardType: TextInputType.name,
                                            decoration: InputDecoration(
                                                hintText:
                                                    "Search by country name or dail code",
                                                hintStyle: const TextStyle(
                                                    color: AppColors.gray,
                                                    fontFamily: sourceSans),
                                                filled: true,
                                                fillColor: AppColors.background,
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            width: 0.5,
                                                            color: AppColors
                                                                .defaultBorder),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                suffixIcon: const Icon(
                                                  Icons.search,
                                                  color: AppColors.primary,
                                                )),
                                          ),
                                          const SizedBox(
                                            height: AppPadding.smallSpacer,
                                          ),
                                          Expanded(
                                              child: FutureBuilder(
                                                  future: countries,
                                                  builder: (context,
                                                      AsyncSnapshot<
                                                              List<Country>>
                                                          snapshot) {
                                                    if (snapshot
                                                            .connectionState ==
                                                        ConnectionState.done) {
                                                      return ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount:snapshot.data!.length ,
                                                          itemBuilder:
                                                              (context, i) {
                                                        return Padding(
                                                          padding: const EdgeInsets.only(bottom: AppPadding.miniSpacer),
                                                          child: Row(
                                                            children: [
                                                              CircleAvatar(
                                                                  backgroundColor:
                                                                      AppColors
                                                                          .primary
                                                                          .withOpacity(
                                                                              0.2),
                                                                  child:
                                                                       Text(
                                                                          snapshot.data![i].flag)),
                                                              const SizedBox(
                                                                width: AppPadding
                                                                    .miniSpacer,
                                                              ),
                                                               Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  CustomRegularTitle(
                                                                    title:
                                                                        snapshot.data![i].name,
                                                                    weight:
                                                                        FontWeight
                                                                            .normal,
                                                                    size: AppPadding
                                                                            .miniSpacer +
                                                                        5,
                                                                  ),
                                                                  SizedBox(
                                                                    height: AppPadding
                                                                            .miniSpacer -
                                                                        5,
                                                                  ),
                                                                  CustomRegularTitle(
                                                                    title: snapshot.data![i].phoneCode,
                                                                    weight:
                                                                        FontWeight
                                                                            .normal,
                                                                    size: AppPadding
                                                                            .miniSpacer +
                                                                        5,
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        );
                                                      });
                                                    } else {
                                                      return CircularProgressIndicator();
                                                    }
                                                  }))
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            height: AppPadding.appPadding + 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: AppColors.defaultBorder),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                      color: AppColors.defaultBorder
                                          .withOpacity(0.4)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(
                                        AppPadding.miniSpacer - 5),
                                    child: Row(
                                      children: [
                                        Icon(Icons.flag),
                                        Icon(Icons.keyboard_arrow_down_outlined)
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: AppPadding.miniSpacer,
                                ),
                                const Text("+237")
                              ],
                            ),
                          ),
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
