import 'package:carefull/features/login/data/models/login_request_body.dart';
import 'package:carefull/features/login/data/repos/login_repo.dart';
import 'package:carefull/features/login/logic/cubit/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormBuilderState>();

  Future<void> emitLogin(LoginRequestBody loginRequestBody) async {
    emit(LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);
    response.fold(
      (failure) => emit(LoginState.failure(failure.errorMessage)),
            (loginResponse) => emit(LoginState.success(loginResponse)),

    );
  }
}
