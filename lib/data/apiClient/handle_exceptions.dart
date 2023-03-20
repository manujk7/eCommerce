// ignore_for_file: no_duplicate_case_values, dead_code

import 'package:dio/dio.dart';

class HandleExceptions implements Exception {
  late String errorMessages;

  HandleExceptions.fromDioError(DioError dioError) {
    print("Sandy - $dioError");
    switch (dioError.type) {
      case DioErrorType.response:
        if (dioError.response?.data != null) {
          errorMessages = dioError.response?.data['message'];
        } else {
          switch (dioError.response!.statusCode) {
            case 400:
              errorMessages = 'Invalid request';
              break;
            case 401:
              errorMessages = 'Access denied';
              break;
            case 403:
              errorMessages = 'Forbidden';
              break;
            case 404:
              errorMessages = 'The requested information could not be found';
              break;
            case 409:
              errorMessages = 'Conflict occurred';
              break;
            case 500:
              errorMessages = 'Internal server error';
              break;
            case 502:
              errorMessages = 'Bad gateway';
              break;
            default:
              errorMessages = 'Unknown error occurred, please try again later.';
          }
          break;
        }
        break;
      case DioErrorType.other:
        errorMessages = 'No internet connection detected, please try again.';
        break;
      case DioErrorType.cancel:
        errorMessages = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        errorMessages = "The connection has timed out, please try again.";
        break;
      case DioErrorType.receiveTimeout:
        errorMessages = "Receive timeout in connection with API server";
        break;
      case DioErrorType.sendTimeout:
        errorMessages = "Send timeout in connection with API server";
        break;
    }
  }

  @override
  String toString() => errorMessages;
}
