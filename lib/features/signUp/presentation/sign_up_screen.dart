import 'package:carefull/core/widgets/app_button.dart';
import 'package:carefull/features/login/presentation/widgets/bottom_text.dart';
import 'package:carefull/features/login/presentation/widgets/terms_and_condotions_text.dart';
import 'package:carefull/features/signUp/logic/cubit/sign_up_cubit.dart';
import 'package:carefull/features/signUp/presentation/widgets/sign_up_form.dart';
import 'package:carefull/features/signUp/presentation/widgets/sign_up_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                SignUpForm(),
                SizedBox(height: 16.h),

                SizedBox(height: 40.h),
                AppButton(
                  title: "Create Account",
                  onPressed: () {
                    if (context
                        .read<SignUpCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      context.read<SignUpCubit>().emitSignUp();
                    }
                  },
                ),
                SizedBox(height: 16.h),
                const TermsAndConditionsText(),
                SizedBox(height: 40.h),
                Center(
                  child: InkWell(
                    onTap: () {
                      context.push("/login");
                    },
                    child: BottomText(title: "Login"),
                  ),
                ),
                SignUpListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
