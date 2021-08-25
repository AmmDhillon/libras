import 'package:dio/dio.dart';

class ApiResponse {
  final Response response;
  final dynamic error;

  ApiResponse(this.response, this.error);

  ApiResponse.withError(dynamic errorValue)
      // ignore: null_check_always_fails
      : response = null!,
        // ignore: dead_code
        error = errorValue;

  ApiResponse.withSuccess(Response responseValue)
      : response = responseValue,
        error = null;
}
