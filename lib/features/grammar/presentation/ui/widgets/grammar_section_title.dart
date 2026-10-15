import 'package:flutter/material.dart';
import 'package:lenguo_app/core/theme/app_text_style.dart';

class GrammarSectionTitle extends StatelessWidget {
  const GrammarSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppTextStyle.loginAndRegisterTitle);
  }
}
