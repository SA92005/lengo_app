import 'package:flutter/material.dart';
import 'package:lenguo_app/core/theme/app_colors.dart';
import 'package:lenguo_app/core/theme/app_text_style.dart';

class WordDetails extends StatelessWidget {
  const WordDetails({
    super.key,
    required this.word,
    required this.translation,
    required this.onPressed,
    required this.example,
    required this.exampleTranslation,
  });
  final String word;
  final String translation;
  final void Function()? onPressed;
  final String example;
  final String exampleTranslation;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.languageSelectionColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightPrimaryColor,
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(word, style: AppTextStyle.loginAndRegisterTitle),
            const SizedBox(height: 8),
            Text(translation, style: AppTextStyle.loginAndRegisterSubtitle),
            IconButton(icon: const Icon(Icons.volume_up), onPressed: onPressed),
            const SizedBox(height: 10),
            Text(example, style: AppTextStyle.loginAndRegisterSubtitle),
            Text(exampleTranslation, style: AppTextStyle.exampleTranslation),
          ],
        ),
      ),
    );
  }
}
