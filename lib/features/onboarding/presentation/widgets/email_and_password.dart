import 'package:carefull/core/widgets/app_form_builder.dart';
import 'package:carefull/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
  }

  bool isObscure = true;
  late TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Email",
            controller: context.read<LoginCubit>().emailController,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: "Email is required"),
              FormBuilderValidators.email(),
            ]),
          ),
          SizedBox(height: 16.h),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
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
              child: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
            ),
          ),
        ],
      ),
    );
  }
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
