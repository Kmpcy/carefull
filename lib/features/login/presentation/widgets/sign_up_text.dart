import 'package:carefull/core/theming/app_colors.dart';
import 'package:carefull/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Already have an account yet?",
        style: AppStyles.lightGrey14.copyWith(color: Colors.black),
        children: [
          TextSpan(
            text: " Sign Up",
            style: AppStyles.lightGrey14.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}