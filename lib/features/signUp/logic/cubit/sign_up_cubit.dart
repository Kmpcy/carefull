import 'package:carefull/features/signUp/data/models/sign_up_request_body.dart';
import 'package:carefull/features/signUp/data/models/sign_up_response.dart';
import 'package:carefull/features/signUp/data/repos/sign_up_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUpRepo) : super(SignUpState.initial());
  final SignUpRepo _signUpRepo;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  void emitSignUp() async {
    emit(SignUpState.loading());
    final response = await _signUpRepo.signUp(
      SignUpRequestBody(
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        password: passwordController.text,
        gender: "0",
        passwordConfirmation: confirmPasswordController.text,
      ),
    );
    response.fold(
      (failure) => emit(SignUpState.failure(failure.errorMessage)),
      (signUpResponse) => emit(SignUpState.success(signUpResponse)),
    );
  }
}
