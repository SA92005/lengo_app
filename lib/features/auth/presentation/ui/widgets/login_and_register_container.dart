import 'package:flutter/material.dart';
import 'package:lenguo_app/core/theme/app_colors.dart';

class LoginAndRegisterContainer extends StatelessWidget {
  const LoginAndRegisterContainer({super.key, required this.icon});
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: icon,
    );
  }
}
