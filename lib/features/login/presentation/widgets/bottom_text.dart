import 'package:carefull/core/theming/app_colors.dart';
import 'package:carefull/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  const BottomText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Already have an account yet?",
        style: AppStyles.lightGrey14.copyWith(color: Colors.black),
        children: [
          TextSpan(
            text: title,
            style: AppStyles.lightGrey14.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
