import 'package:carefull/core/widgets/app_button.dart';
import 'package:carefull/core/widgets/app_form_builder.dart';
import 'package:carefull/features/login/presentation/widgets/bottom_text.dart';
import 'package:carefull/features/login/presentation/widgets/terms_and_condotions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

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
                FormBuilder(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        hintText: "Name",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.alphabetical(),
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(3),
                        ]),
                      ),
                      SizedBox(height: 16.h),

                      AppTextFormField(
                        keyboardType: TextInputType.phone,
                        hintText: "Phone",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.phoneNumber(),
                          FormBuilderValidators.match(
                            errorText: "Invalid Phone Number",
                            RegExp(r'^(?:\+20)?(010|011|012|015)\d{8}$'),
                          ),
                        ]),
                      ),
                      SizedBox(height: 16.h),

                      AppTextFormField(
                        hintText: "Email",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: "Email is required",
                          ),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      SizedBox(height: 16.h),
                      AppTextFormField(
                        hintText: "Password",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: "Password is required",
                          ),
                          FormBuilderValidators.hasLowercaseChars(),
                          FormBuilderValidators.hasUppercaseChars(),
                          FormBuilderValidators.hasSpecialChars(),
                          FormBuilderValidators.hasNumericChars(),
                          FormBuilderValidators.minLength(
                            6,
                            errorText: "Password must be at least 6 characters",
                          ),
                        ]),
                        isObscureText: isObscure,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: Icon(
                            isObscure ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),

                      AppTextFormField(
                        hintText: "Password Confirmation ",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: "Password is required",
                          ),
                          FormBuilderValidators.hasLowercaseChars(),
                          FormBuilderValidators.hasUppercaseChars(),
                          FormBuilderValidators.hasSpecialChars(),
                          FormBuilderValidators.hasNumericChars(),
                          FormBuilderValidators.minLength(
                            6,
                            errorText: "Password must be at least 6 characters",
                          ),
                        ]),
                        isObscureText: isObscure,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: Icon(
                            isObscure ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),

                SizedBox(height: 40.h),
                AppButton(
                  title: "Create Account",
                  onPressed: () {
                    // if (context
                    //     .read<LoginCubit>()
                    //     .formKey
                    //     .currentState!
                    //     .validate()) {
                    //   final email = context
                    //       .read<LoginCubit>()
                    //       .emailController
                    //       .text;
                    //   final password = context
                    //       .read<LoginCubit>()
                    //       .passwordController
                    //       .text;
                    //   context.read<LoginCubit>().emitLogin(
                    //     LoginRequestBody(email: email, password: password),
                    //   );
                    // }
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
                // const LoginAndListner(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
