import 'package:flutter/material.dart';
import 'package:freemo_test/constants/color.dart';
import 'package:freemo_test/constants/global.dart';
import 'package:freemo_test/common/widgets/custom_regular_title.dart';

class CustomTextfield extends StatefulWidget {
  CustomTextfield(
      {super.key,
      required this.controller,
      this.textInputType = TextInputType.text,
      required this.hintText,
      this.isPassword = false,
      this.selected = false,
      this.codeKey = 1,
      this.password = "",
      this.isSuffix = false,
      this.isPrefix = false,
      this.readOnly = false,
      this.prefixIcon = Icons.lock_outline,
      this.prefixIconColor=AppColors.gray, 
       this.hasBorder=true
      
      });

  final TextEditingController controller;
  final TextInputType textInputType;
  final String hintText;
  final int codeKey;
  final String password;
  final bool isSuffix;
  final bool isPrefix;
  final IconData prefixIcon;
  final Color prefixIconColor;
  final bool readOnly;
  final bool hasBorder;

  bool isPassword;
  bool selected;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  ValueNotifier<bool> notiferValidated = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: notiferValidated,
        builder: (context, value, child) {
          return Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom:  BorderSide.none
                        )),
            child: TextFormField(
              style: const TextStyle(
                  color: AppColors.onBackground, fontFamily: poppins),
              readOnly: widget.readOnly,
              maxLines: 1,
              controller: widget.controller,
              obscureText: widget.isPassword
                  ? !widget.selected
                      ? true
                      : false
                  : false,
              keyboardType: widget.textInputType,
              decoration: InputDecoration(
                suffix: widget.isSuffix
                    ? const CustomRegularTitle(
                        title: "Hours",
                        family: poppins,
                        color: AppColors.onBackground,
                        size: 15,
                      )
                    : null,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                    color: AppColors.gray,
                    fontFamily: poppins,
                    fontSize: 13),
                filled: true,
                fillColor: AppColors.background,
                focusedBorder: widget.hasBorder? OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)):InputBorder.none,
                enabledBorder: widget.hasBorder? OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 0.5, color: AppColors.defaultBorder),
                    borderRadius: BorderRadius.circular(10)):InputBorder.none,
                prefixIcon: widget.isPrefix
                    ? Icon(
                        widget.prefixIcon,
                        color: widget.prefixIconColor,
                      )
                    : SizedBox(),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: () {
                          widget.selected = !widget.selected;
                          setState(() {});
                        },
                        icon: widget.selected
                            ? const Icon(
                                Icons.visibility_off_outlined,
                                color: AppColors.onBackground,
                              )
                            : const Icon(
                                Icons.visibility_outlined,
                                color: AppColors.onBackground,
                              ))
                    : null,
                errorBorder:  widget.hasBorder? OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.red),
                    borderRadius: BorderRadius.circular(10)): InputBorder.none,
                focusedErrorBorder:  widget.hasBorder?OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.defaultBorder),
                    borderRadius: BorderRadius.circular(10)): InputBorder.none,
              ),
              validator: (val) {
                switch (widget.codeKey) {
                

                  case 1:
                    if (val!.isEmpty || !RegExp(r'.*').hasMatch(val)) {
                      notiferValidated.value = true;

                      return "Please enter a correct password";
                    } else if (val.length < 8) {
                      return "Please enter at least 8 characters";
                    } else {
                      return null;
                    }
                  case 2:
                    if (val != widget.password) {
                      notiferValidated.value = true;

                      return "Confirmation password incorrect";
                    } else {
                      return null;
                    }

               
                  default:
                }
                return null;
              },
            ),
          );
        });
  }
}
