import 'package:carefull/core/widgets/app_button.dart';
import 'package:carefull/features/onboarding/presentation/widgets/doc_description.dart';
import 'package:carefull/features/onboarding/presentation/widgets/doc_image_and_text.dart';
import 'package:carefull/features/onboarding/presentation/widgets/docdoc_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                DocdocRow(),
                SizedBox(height: 30.h),
                DocImageAndText(),
                DocDescription(),
                SizedBox(height: 32.h),
                AppButton(
                  title: "Get Started",
                  onPressed: () {
                    context.go("/login");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
