import 'package:flutter/material.dart';
import 'package:lenguo_app/core/theme/app_text_style.dart';

class LoginAndRegisterFooter extends StatelessWidget {
  const LoginAndRegisterFooter({
    super.key,
    required this.text1,
    required this.onPressed,
    required this.text2,
  });
  final String text1;
  final String text2;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const Text("Don't have an account?"),
        Text(text1),
        TextButton(
          onPressed: onPressed,
          child: Text(text2, style: AppTextStyle.loginAndRegisterfooter),
        ),
      ],
    );
  }
}
