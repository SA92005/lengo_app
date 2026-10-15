import 'package:flutter/material.dart';
import 'package:lenguo_app/core/theme/app_colors.dart';
import 'package:lenguo_app/core/theme/app_text_style.dart';

class GrammarContainer extends StatelessWidget {
  const GrammarContainer({
    super.key,
    required this.name,
    required this.nameAr,
    required this.onTap,
  });
  final String name;
  final String nameAr;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyColor,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            spacing: 2,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(nameAr, style: AppTextStyle.exampleTranslation),
              Text(name, style: AppTextStyle.loginAndRegisterSubtitle),
            ],
          ),
        ),
      ),
    );
  }
}
