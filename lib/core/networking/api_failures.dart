import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;

  const Failures(this.errorMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection Timeout");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Connection Send Timeout");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Connection  Receive Timeout");
      case DioExceptionType.badResponse:
        return ServerFailure.fromresponse(
            dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure("Request Cancelled");
      case DioExceptionType.connectionError:
        return ServerFailure("No Internet Connection");
      case DioExceptionType.unknown:
        return ServerFailure("There is was an error, please try again later");
      default:
        return ServerFailure("There is was an error, please try again later");
    }
  }

  factory ServerFailure.fromresponse(int statusCode, dynamic response) {
    switch (statusCode) {
      case 400:
        return ServerFailure(response["error"]["message"]);
      case 401:
        return ServerFailure(response["message"]);
      case 403:
        return ServerFailure(response["error"]["message"]);
      case 404:
        return ServerFailure("Not Found");
      case 500:
        return ServerFailure("Internal Server Error");
      default:
        return ServerFailure("Unknown Error");
    }
  }
}
