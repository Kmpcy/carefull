
import 'package:carefull/core/widgets/app_form_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EmailAndPassword extends StatefulWidget {
   EmailAndPassword({
    super.key,
    required this.formKey,
    required this.isObscure,
  });

  final GlobalKey<FormBuilderState> formKey;
   bool isObscure=true;

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: widget.formKey,
      child: Column(
        children: [
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
              FormBuilderValidators.required(),
              FormBuilderValidators.minLength(
                6,
                errorText: "Password must be at least 6 characters",
              ),
            ]),
            isObscureText: widget.isObscure,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  widget.isObscure  = !widget.isObscure;
                });
              },
              child: Icon(
                widget.isObscure ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
