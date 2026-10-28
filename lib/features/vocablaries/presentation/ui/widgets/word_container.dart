import 'package:flutter/material.dart';
import 'package:lenguo_app/core/theme/app_colors.dart';
import 'package:lenguo_app/core/theme/app_text_style.dart';

class WordContainer extends StatelessWidget {
  const WordContainer({
    super.key,
    required this.url,
    required this.word,
    required this.translation,
    required this.onTap,
  });
  final String url;
  final String word;
  final String translation;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(url)),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(word, style: AppTextStyle.exampleTranslation),
                  Text(
                    translation,
                    style: AppTextStyle.loginAndRegisterSubtitle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
