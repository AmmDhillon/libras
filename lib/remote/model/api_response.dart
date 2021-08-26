import 'package:dio/dio.dart';

class ApiResponse {

  Map response;
  Object error;

  ApiResponse(this.response, this.error);

  ApiResponse.withError(String errorValue): error = errorValue, response = Map();

  ApiResponse.withSuccess(Map responseValue): response = responseValue, error = new Object();
}
