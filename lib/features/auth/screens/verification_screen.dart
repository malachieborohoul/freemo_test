

import 'package:flutter/material.dart';
import 'package:freemo_test/common/widgets/custom_button.dart';
import 'package:freemo_test/constants/color.dart';
import 'package:freemo_test/constants/global.dart';
import 'package:freemo_test/constants/padding.dart';
import 'package:freemo_test/features/auth/widgets/textbox_verification.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen(
      {Key? key, required this.email,})
      : super(key: key);
  static const routeName = 'verification-screen';

  final String email;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

bool _selected = false;

class _VerificationScreenState extends State<VerificationScreen>
    with SingleTickerProviderStateMixin {
  final _codeVerificationFormKey = GlobalKey<FormState>();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();

  // final AuthService _authService = AuthService();

  late final _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 750));

  late final _scaleAnimation = Tween<double>(begin: 1.0, end: 30).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.easeInOutExpo))
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigator.pushReplacementNamed(context, BottomBar.routeName);
      }
    });

  void codeVerification(var code) {
   
  }

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
    // void codeVerification(var code) {
    //   if (code == userProvider.user.verify_code) {
    //     _authService.codeVerification(
    //         context: context,
    //         codeVerification: code,
    //         onSuccess: () {
    //           setState(() {
    //             _selected = !_selected;
    //           });

    //           _animationController.forward();
    //         });
    //   } else {
    //     // setState(() {
    //     //   _selected = !_selected;
    //     // });
    //     showSnackBar(context, "Code incorrecte");
    //   }
    // }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      // onTap: () =>
      //     Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return VerificationScreen();
      // })),
      child: Scaffold(
          appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    child: const Icon(
                      Icons.arrow_circle_left_outlined,
                      size: 40,
                      color: AppColors.primary,
                      weight: 0.1,
                    ),
                  ),
                )
              ,
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.appPadding),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Verification",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Icon(
                      Icons.email_outlined,
                      color: AppColors.primary,
                      size: AppPadding.spacer,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: const TextStyle(
                            fontSize: 15,
                            color: AppColors.defaultBorder,
                            fontFamily: sourceSans,
                          ),
                          children: [
                            const TextSpan(
                              text: "Verification code sent",
                            ),
                            TextSpan(
                                text: widget.email,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.onBackground)),
                          ]),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Form(
                      key: _codeVerificationFormKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextBoxVerification(
                            first: true,
                            controller: _controller1,
                            onTap: () {},
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          TextBoxVerification(
                            controller: _controller2,
                            onTap: () {},
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          TextBoxVerification(
                            controller: _controller3,
                            onTap: () {},
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          TextBoxVerification(
                            controller: _controller4,
                            onTap: () {},
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          TextBoxVerification(
                            controller: _controller5,
                            onTap: () {},
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          TextBoxVerification(
                            controller: _controller6,
                            onTap: () {
                              setState(() {
                                // _selected = true;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // RichText(
                    //   textAlign: TextAlign.center,
                    //   text: const TextSpan(
                    //       style: TextStyle(
                    //           fontSize: 13,
                    //           color: textGrey,
                    //           fontWeight: FontWeight.w300),
                    //       children: [
                    //         TextSpan(
                    //           text: "Vous n'avez pas reçu le code ? ",
                    //         ),
                    //         TextSpan(
                    //             text: "Renvoyer le code",
                    //             style: TextStyle(
                    //                 fontWeight: FontWeight.bold,
                    //                 color: primary)),
                    //       ]),
                    // ),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_codeVerificationFormKey.currentState!.validate()) {
                          setState(() {
                            // _selected = !_selected;
                            var code = _controller1.text +
                                _controller2.text +
                                _controller3.text +
                                _controller4.text +
                                _controller5.text +
                                _controller6.text;
                            // print(code);
                            _selected = true;
                            codeVerification(code);
                          });
                        }
                      },
                      child: _selected
                          ? const CustomButton(
                              isLoading: true,
                            )
                          : const CustomButton(
                              text: "Verify",
                    )),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
