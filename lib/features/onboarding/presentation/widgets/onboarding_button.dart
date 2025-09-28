

import 'package:carefull/core/theming/app_colors.dart';
import 'package:carefull/core/theming/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class onboardinButton extends StatelessWidget {
  const onboardinButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          minimumSize: Size(311.w, 52.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        onPressed: () {
          context.push("/login");
      
        },
        child: Text("Get Started", style: AppStyles.white20),
      ),
    );
  }
}
