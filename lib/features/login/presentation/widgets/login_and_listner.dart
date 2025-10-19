import 'package:carefull/features/login/logic/cubit/login_cubit.dart';
import 'package:carefull/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginAndListner extends StatelessWidget {
  const LoginAndListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failed,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showDialog(
            context: context,
            barrierDismissible: false,
            
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          ),
          success: (loginResponse) {
            Navigator.of(context).pop();
            context.go('/home');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Welcome, ${loginResponse.message}!')),
            );
          },
          failure: (errorMessage) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(errorMessage)));
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
