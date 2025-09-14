import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMess;

  Failure({required this.errorMess});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMess});

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMess:
              "Connection timeout with the server. Please check your internet.",
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          errorMess: "Send timeout occurred. Please try again.",
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          errorMess: "Receive timeout from the server. Please try again later.",
        );
      case DioExceptionType.badCertificate:
        return ServerFailure(
          errorMess:
              "Bad SSL certificate. Unable to establish a secure connection.",
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response?.statusCode,
          e.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(
          errorMess: "The request was cancelled before completion.",
        );
      case DioExceptionType.connectionError:
        return ServerFailure(
          errorMess:
              "Failed to connect to the server. Please check your network.",
        );
      case DioExceptionType.unknown:
        return ServerFailure(
          errorMess: "An unknown error occurred while processing the request.",
        );
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return ServerFailure(
          errorMess: "Bad request. Please check your input.",
        );
      case 401:
        return ServerFailure(errorMess: "Unauthorized. Please log in again.");
      case 403:
        return ServerFailure(
          errorMess:
              "Forbidden. You don’t have permission to access this resource.",
        );
      case 404:
        return ServerFailure(
          errorMess: "Not found. The requested resource doesn’t exist.",
        );
      case 409:
        return ServerFailure(errorMess: "Conflict occurred. Please try again.");
      case 500:
        return ServerFailure(
          errorMess: "Internal server error. Please try again later.",
        );
      case 502:
        return ServerFailure(
          errorMess: "Bad gateway. The server is unavailable.",
        );
      case 503:
        return ServerFailure(
          errorMess: "Service unavailable. Please try again later.",
        );
      default:
        return ServerFailure(
          errorMess: "Unexpected server error (status code: $statusCode).",
        );
    }
  }
}
