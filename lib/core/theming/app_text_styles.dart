import 'package:carefull/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static TextStyle blue32 = TextStyle(
    fontSize: 32.sp,
    height: 1.5,

    fontFamily: "Inter",
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static TextStyle grey15 = TextStyle(
    fontSize: 15.sp,
    height: 1.5,

    fontFamily: "Inter",
    fontWeight: FontWeight.w400,
    color: Color(0xff757575),
  );

  static TextStyle white20 = TextStyle(
    fontSize: 20.sp,
    height: 1.5,

    fontFamily: "Inter",
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle blue24 = TextStyle(
    fontSize: 24.sp,
    fontFamily: "Inter",
    fontWeight: FontWeight.w900,
    color: AppColors.primary,
  );


 static TextStyle lightGrey14 = TextStyle(
    fontSize: 14.sp,
    height: 1.8,
    fontFamily: "Inter",
    fontWeight: FontWeight.w400,
    color: AppColors.lightGrey,
  );

}
