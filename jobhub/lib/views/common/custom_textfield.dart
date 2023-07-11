import 'package:flutter/material.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/views/common/app_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.keyBoardType,
      this.validator,
      this.suffixIcon,
      this.obscureText});
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyBoardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(kLightGrey.value)),
        child: TextFormField(
          keyboardType: keyBoardType,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              hintStyle: appstyle(
                14,
                Color(kDarkGrey.value),
                FontWeight.w600,
              ),
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: Colors.red, width: 0.5)),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: Colors.transparent, width: 0)),
              focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: Colors.red, width: 0.5)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide:
                      BorderSide(color: Color(kDarkGrey.value), width: 0.5)),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide:
                      BorderSide(color: Colors.transparent, width: 0.5)),
              border: InputBorder.none),
          controller: controller,
          cursorHeight: 25,
          style: appstyle(14, Color(kDark.value), FontWeight.w500),
          validator: validator,
        ));
  }
}
