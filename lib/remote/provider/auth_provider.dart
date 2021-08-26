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

    if (apiResponse.response["code"] == 200) {
      Map map = apiResponse.response;
      String msg = map["msg"];
      // authRepo.saveUserToken(token);
      responseModel = ResponseModel(true, msg);
    } else {
      String msg = apiResponse.error.toString();
      responseModel = ResponseModel(false, msg);
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

    if (apiResponse.response["code"] == 200) {
      Map map = apiResponse.response;
      // authRepo.saveUserToken(token);
      responseModel = ResponseModel(true, 'successful');
    } else {
      // Map map = apiResponse.error;
      // String msg = map["msg"];
      responseModel = ResponseModel(false, apiResponse.error.toString());
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
}
