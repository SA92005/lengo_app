import 'package:flutter/material.dart';
import 'package:lenguo_app/core/theme/app_colors.dart';
import 'package:lenguo_app/core/theme/app_text_style.dart';

class ContainerSelection extends StatelessWidget {
  const ContainerSelection({
    super.key,
    required this.photoPath,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.onTap,
  });
  final String photoPath;
  final String title;
  final String subtitle1;
  final String subtitle2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.languageSelectionColor,
          border: Border.all(
            color: AppColors.languageSelectionBorder,
            width: 3,
          ),
        ),
        child: Row(
          children: [
            Image.asset(photoPath, width: 100, height: 80, fit: BoxFit.cover),
            Expanded(
              child: Column(
                children: [
                  Text(
                    title,
                    style: AppTextStyle.loginAndRegisterTitle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    subtitle1,
                    style: AppTextStyle.loginAndRegisterSubtitle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    subtitle2,
                    style: AppTextStyle.loginAndRegisterSubtitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
