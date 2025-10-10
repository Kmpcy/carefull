import 'package:carefull/core/theming/app_text_styles.dart';
import 'package:carefull/core/widgets/app_button.dart';
import 'package:carefull/features/login/data/models/login_request_body.dart';
import 'package:carefull/features/login/logic/cubit/login_cubit.dart';
import 'package:carefull/features/login/presentation/widgets/sign_up_text.dart';
import 'package:carefull/features/login/presentation/widgets/terms_and_condotions_text.dart';
import 'package:carefull/features/onboarding/presentation/widgets/email_and_password.dart';
import 'package:carefull/features/onboarding/presentation/widgets/login_and_listner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
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
                EmailAndPassword(),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forget Password?",
                    style: AppStyles.blue24.copyWith(fontSize: 15.sp),
                  ),
                ),
                SizedBox(height: 40.h),
                AppButton(
                  title: "Login",
                  onPressed: () {
                    if (context
                        .read<LoginCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      final email = context
                          .read<LoginCubit>()
                          .emailController
                          .text;
                      final password = context
                          .read<LoginCubit>()
                          .passwordController
                          .text;
                      context.read<LoginCubit>().emitLogin(
                        LoginRequestBody(email: email, password: password),
                      );
                    }
                  },
                ),
                SizedBox(height: 16.h),
               const TermsAndConditionsText(),
                SizedBox(height: 40.h),
               const Center(child: SignUpText()),
              const LoginAndListner(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
