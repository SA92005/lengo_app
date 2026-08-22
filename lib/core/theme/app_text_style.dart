import 'package:flutter/material.dart';
import 'package:lenguo_app/core/theme/app_colors.dart';

abstract class AppTextStyle {
  static const TextStyle loginAndRegisterTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle loginAndRegisterSubtitle = TextStyle(
    color: AppColors.greyColor,
    fontSize: 15,
    height: 1.5,
  );
  static const TextStyle loginAndRegisterTextButton = TextStyle(
    color: AppColors.backgroundColor,
    fontSize: 25,
    // fontWeight: FontWeight.bold,
  );
  static const TextStyle loginAndRegisterfooter = TextStyle(
    color: AppColors.primaryColor,
  );
  static const TextStyle hintStyle = TextStyle(color: AppColors.greyColor);
}
