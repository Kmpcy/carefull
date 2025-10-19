import 'package:carefull/core/widgets/app_form_builder.dart';
import 'package:carefull/features/signUp/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isObscure = true;

  @override
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
  }

  Widget build(BuildContext context) {
    return FormBuilder(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<SignUpCubit>().nameController,
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
            controller: context.read<SignUpCubit>().phoneController,
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
            controller: context.read<SignUpCubit>().emailController,
            hintText: "Email",
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: "Email is required"),
              FormBuilderValidators.email(),
            ]),
          ),
          SizedBox(height: 16.h),
          AppTextFormField(
            controller: context.read<SignUpCubit>().passwordController,
            hintText: "Password",
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: "Password is required"),
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
              child: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
            ),
          ),
          SizedBox(height: 16.h),

          AppTextFormField(
            controller: context.read<SignUpCubit>().confirmPasswordController,
            hintText: "Password Confirmation ",
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: "Password is required"),
              FormBuilderValidators.hasLowercaseChars(),
              FormBuilderValidators.hasUppercaseChars(),
              FormBuilderValidators.hasSpecialChars(),
              FormBuilderValidators.hasNumericChars(),
              FormBuilderValidators.equal(
                passwordController.text,
                errorText: " Passwords do not match",
              ),
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
              child: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
