

import 'package:carefull/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "By logging, you agree to our ",
        style: AppStyles.lightGrey14,
        children: [
          TextSpan(
            text: "Terms & Conditions ",
            style: AppStyles.lightGrey14.copyWith(color: Colors.black),
          ),
          TextSpan(text: "and ", style: AppStyles.lightGrey14),
          TextSpan(
            text: "Privacy Policy. ",
            style: AppStyles.lightGrey14.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
