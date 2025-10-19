import 'package:carefull/core/networking/api_service.dart';
import 'package:carefull/core/networking/dio_factory.dart';
import 'package:carefull/features/login/data/repos/login_repo.dart';
import 'package:carefull/features/login/logic/cubit/login_cubit.dart';
import 'package:carefull/features/signUp/data/repos/sign_up_repo.dart';
import 'package:carefull/features/signUp/logic/cubit/sign_up_cubit.dart';
import 'package:carefull/features/signUp/presentation/sign_up_screen.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
}
