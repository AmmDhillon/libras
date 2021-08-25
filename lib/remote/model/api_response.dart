import 'package:dio/dio.dart';

class ApiResponse {

  final Response response;
  final dynamic error;

  ApiResponse(this.response, this.error);

  ApiResponse.withError(String errorValue): error = errorValue, response = null!;

  ApiResponse.withSuccess(Response responseValue): response = responseValue, error = null;
}
