import 'package:carefull/core/theming/app_text_styles.dart';
import 'package:carefull/core/widgets/app_button.dart';
import 'package:carefull/features/login/presentation/widgets/email_and_password.dart';
import 'package:carefull/features/login/presentation/widgets/sign_up_text.dart';
import 'package:carefull/features/login/presentation/widgets/terms_and_condotions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 30.w,
              vertical: 30.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back", style: AppStyles.blue24),
                SizedBox(height: 8.h),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: AppStyles.lightGrey14,
                ),
                SizedBox(height: 35.h),
                EmailAndPassword(formKey: formKey, isObscure: isObscure),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forget Password?",
                    style: AppStyles.blue24.copyWith(fontSize: 15.sp),
                  ),
                ),
                SizedBox(height: 40.h),
                AppButton(title: "Login", onPressed: () {}),
                SizedBox(height: 16.h),
                TermsAndConditionsText(),
                SizedBox(height: 40.h),
                Center(child: SignUpText()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 