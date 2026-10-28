import 'package:flutter/material.dart';
import 'package:lenguo_app/core/theme/app_colors.dart';

class PhotoContainer extends StatelessWidget {
  const PhotoContainer({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19),
        child: Image.network(
          url,
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
