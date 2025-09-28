
import 'package:carefull/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';

class DocDescription extends StatelessWidget {
  const DocDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
      style: AppStyles.grey15,
      textAlign: TextAlign.center,
    );
  }
}
