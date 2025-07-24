import 'package:dio/dio.dart';

abstract class Failuer {
  final String errorMessage;

  Failuer(this.errorMessage);
}

class SerrverFailuer extends Failuer {
  SerrverFailuer(super.errorMessage);

  factory SerrverFailuer.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return SerrverFailuer("server timeout");
      case DioExceptionType.sendTimeout:
        return SerrverFailuer("send timeout");
      case DioExceptionType.receiveTimeout:
        return SerrverFailuer("reseve timeout");
      case DioExceptionType.badCertificate:
        return SerrverFailuer("badCertificate");

      case DioExceptionType.badResponse:
        return SerrverFailuer.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.cancel:
        return SerrverFailuer("scancle");
      case DioExceptionType.connectionError:
        return SerrverFailuer("connectionError");
      case DioExceptionType.unknown:
        if (dioException.message!.contains("SocketExceptio")) {
          return SerrverFailuer("No internet conncetion");
        }
        return SerrverFailuer("unexpucted error");
      default:
        return SerrverFailuer("ops there is an error");
    }
  }

  factory SerrverFailuer.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return SerrverFailuer(response["error"]["message"]);
    } else if (statusCode == 404) {
      return SerrverFailuer("your request not found , try agian");
    } else if (statusCode == 500) {
      return SerrverFailuer("internal server error , try again");
    } else {
      return SerrverFailuer("ops there is an error");
    }
  }
}
