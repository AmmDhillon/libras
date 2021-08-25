import 'package:flpapp/remote/model/api_response.dart';
import 'package:flpapp/remote/model/error_response.dart';
import 'package:flpapp/remote/model/response_model.dart';
import 'package:flpapp/remote/repository/auth_repo.dart';
import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {

  final AuthRepo authRepo;

  AuthProvider({required this.authRepo});

  // for registration section
  bool _isLoading = false;
  bool _isCustomer = true;
  bool _isStatusChecked = false;

  bool get isCustomer => _isCustomer;
  bool get isStatusChecked => _isStatusChecked;
  bool get isLoading => _isLoading;

  String _registrationErrorMessage = '';
  String get registrationErrorMessage => _registrationErrorMessage;

  updateRegistrationErrorMessage(String message) {
    _registrationErrorMessage = message;
    notifyListeners();
  }

  Future<ResponseModel> registration({String? name, String? mobile, String? referredBy, String? password}) async {
    _isLoading = true;
    _registrationErrorMessage = '';
    notifyListeners();
    ApiResponse apiResponse = await authRepo.registration(name: name, mobile: mobile, referredBy: referredBy, password: password);
    ResponseModel responseModel;
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      Map map = apiResponse.response.data;
      String token = map["token"];
      authRepo.saveUserToken(token);
      responseModel = ResponseModel(true, 'successful');
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        errorMessage = errorResponse.errors[0].message;
      }
      print(errorMessage);
      _registrationErrorMessage = errorMessage;
      responseModel = ResponseModel(false, errorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  // for login section
  String _loginErrorMessage = '';

  String get loginErrorMessage => _loginErrorMessage;

  Future<ResponseModel> login(String mobile, String password) async {
    _isLoading = true;
    _loginErrorMessage = '';
    notifyListeners();
    ApiResponse apiResponse = await authRepo.login(mobile: mobile, password: password);
    ResponseModel responseModel;
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      Map map = apiResponse.response.data;
      String token = map["token"];
      authRepo.saveUserToken(token);
      responseModel = ResponseModel(true, 'successful');
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      print(errorMessage);
      _loginErrorMessage = errorMessage;
      responseModel = ResponseModel(false, errorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
}
