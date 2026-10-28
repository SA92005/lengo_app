import 'package:flutter/material.dart';
import 'package:lenguo_app/core/theme/app_colors.dart';
import 'package:lenguo_app/core/theme/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.isObsecure = false,
    required this.validator,
    this.suffixIcon,
  });
  final TextEditingController controller;
  final String hintText;
  final Icon? prefixIcon;
  final bool isObsecure;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: isObsecure,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyle.hintStyle,

          labelText: hintText,
          labelStyle: AppTextStyle.hintStyle,
          floatingLabelStyle: AppTextStyle.loginAndRegisterfooter,
          alignLabelWithHint: false,
          suffixIcon: suffixIcon,

          filled: true,
          fillColor: AppColors.backgroundColor,
          prefixIcon: prefixIcon,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 16,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.greyColor),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
