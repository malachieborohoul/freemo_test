import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freemo_test/constants/color.dart';

class TextBoxVerification extends StatefulWidget {
  const TextBoxVerification(
      {Key? key,
      required this.controller,
      required this.onTap,
      this.first = false,
      this.last = false})
      : super(key: key);
  final TextEditingController controller;
  final VoidCallback onTap;
  final bool first;
  final bool last;

  @override
  State<TextBoxVerification> createState() => _TextBoxVerificationState();
}

class _TextBoxVerificationState extends State<TextBoxVerification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: 50,
      // height: 48,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: TextFormField(
        controller: widget.controller,
        onChanged: (value) {
          if (value.length == 1 && widget.last == false) {
            FocusScope.of(context).nextFocus();
            widget.onTap();
          }
          if (value.length == 0 && widget.first == false) {
            FocusScope.of(context).previousFocus();
            widget.onTap();
          }
        },
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.top,
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        decoration: const InputDecoration(
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
          ),
        ),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return "";
          }
          return null;
        },
      ),
    );
  }
}
