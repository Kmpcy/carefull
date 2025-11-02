import 'package:carefull/core/networking/api_failures.dart';
import 'package:carefull/core/networking/api_service.dart';
import 'package:carefull/features/signUp/data/models/sign_up_request_body.dart';
import 'package:carefull/features/signUp/data/models/sign_up_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

 class SignUpRepo {
 final  ApiService _apiService;
  SignUpRepo(this._apiService);

  Future<Either<Failures, SignUpResponse>> signUp(
    SignUpRequestBody signUpRequestBody,
  ) async {
    try {
      final response = await _apiService.signUp(signUpRequestBody);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
