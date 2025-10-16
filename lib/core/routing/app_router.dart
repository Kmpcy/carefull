import 'package:carefull/core/di/di.dart';
import 'package:carefull/features/home/home.dart';
import 'package:carefull/features/login/logic/cubit/login_cubit.dart';
import 'package:carefull/features/login/presentation/login_screen.dart';
import 'package:carefull/features/onboarding/presentation/onboarding_screen.dart';
import 'package:carefull/features/signUp/presentation/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
    ),
    GoRoute(
      path: '/login',
        builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginScreen(),
        );
      },
    ),

    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/signUp',
      builder: (BuildContext context, GoRouterState state) {
        return  SignUp();
      },
    ),
  ],
);
