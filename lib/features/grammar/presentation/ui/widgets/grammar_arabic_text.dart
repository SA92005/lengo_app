import 'package:flutter/material.dart';
import 'package:lenguo_app/core/theme/app_text_style.dart';

class GrammarArabicText extends StatelessWidget {
  const GrammarArabicText({
    super.key,
    required this.text,
    this.bullet = false,
    this.textDirection,
    this.alignment = AlignmentGeometry.center,
  });

  final String text;
  final bool bullet;
  final TextDirection? textDirection;
  final AlignmentGeometry alignment;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
        bullet ? '• $text' : text,
        style: AppTextStyle.loginAndRegisterSubtitle,
        textDirection: textDirection,
      ),
    );
  }
}
