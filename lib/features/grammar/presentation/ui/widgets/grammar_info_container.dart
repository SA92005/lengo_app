import 'package:flutter/material.dart';
import 'package:lenguo_app/core/theme/app_colors.dart';

class GrammarInfoContainer extends StatelessWidget {
  const GrammarInfoContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.languageSelectionColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
