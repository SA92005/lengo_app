import 'package:flutter/material.dart';
import 'package:lenguo_app/core/theme/app_colors.dart';

abstract class AppIcons {
  static const Icon loginIcon = Icon(
    Icons.translate,
    color: AppColors.primaryColor,
    size: 40,
  );
  static const Icon registerIcon = Icon(
    Icons.login,
    color: AppColors.primaryColor,
    size: 40,
  );
}
