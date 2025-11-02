import 'package:carefull/core/routing/app_router.dart';
import 'package:carefull/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarefullApp extends StatelessWidget {

  const CarefullApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primaryColor: AppColors.primary,
          ),
          routerConfig: router,
        );
      },
    );
  }
}
