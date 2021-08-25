import 'package:dio/dio.dart';
import 'package:flpapp/api_constants.dart';
import 'package:flpapp/remote/dio/api_error_handler.dart';
import 'package:flpapp/remote/dio/dio_client.dart';
import 'package:flpapp/remote/model/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final DioClient dioClient;
  late SharedPreferences sharedPreferences;

  AuthRepo({required this.dioClient});

  Future<ApiResponse> registration(
      {String? name,
      String? mobile,
      String? referredBy,
      String? password}) async {
    try {
      Response response = await dioClient.post(
        APIConstants.SIGN_UP,
        data: {
          "name": name,
          "mobile_num": mobile,
          "referred_by": referredBy,
          "password": password
        },
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> login({String? mobile, String? password}) async {
    try {
      Response response = await dioClient.post(
        APIConstants.LOGIN,
        data: {"mobile_num": mobile, "password": password},
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e.toString());
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<void> saveUserToken(String token) async {
    // dioClient.token = token;
    dioClient.dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };

    try {
      await sharedPreferences.setString(APIConstants.TOKEN, token);
    } catch (e) {
      throw e;
    }
  }

  String getUserToken() {
    return sharedPreferences.getString(APIConstants.TOKEN) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(APIConstants.TOKEN);
  }

  Future<bool> clearSharedData() async {
    await sharedPreferences.remove(APIConstants.TOKEN);
    await sharedPreferences.remove(APIConstants.MOBILE_NUM);
    await sharedPreferences.remove(APIConstants.NAME);
    return true;
  }

  String getUserNumber() {
    return sharedPreferences.getString(APIConstants.MOBILE_NUM) ?? "";
  }

  String getUserName() {
    return sharedPreferences.getString(APIConstants.NAME) ?? "";
  }
}
