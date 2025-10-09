import 'package:carefull/core/networking/api_service.dart';
import 'package:carefull/features/login/data/models/login_request_body.dart';
import 'package:carefull/features/login/data/models/login_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/networking/api_failures.dart';

class LoginRepo {
  final ApiService _apiService;
  LoginRepo(this._apiService);

  Future<Either<LoginResponse, Failures>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return Left(response);
    } catch (e) {
      if (e is DioException) {
        return Right(ServerFailure.fromDioException(e));
      } else {
        return Right(ServerFailure(e.toString()));
      }
    }
  }
}
