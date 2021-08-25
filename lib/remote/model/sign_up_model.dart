class SignUpModel {
  late int _code;
  late String _status;
  late Data _data;

  int get code => _code;
  String get status => _status;
  Data get data => _data;

  SignUpModel({
      int? code,
      String? status,
      Data? data}){
    _code = code!;
    _status = status!;
    _data = data!;
}

  SignUpModel.fromJson(dynamic json) {
    _code = json["code"];
    _status = json["status"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null!;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    map["status"] = _status;
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    return map;
  }

}

class Data {
  dynamic _id;
  late String _name;
  late int _mobileNum;
  late String _password;
  late double _balance;
  late int _level;
  late int _referredBy;
  late int _undersignedOf;
  late String _status;
  late bool _admin;

  dynamic get id => _id;
  String get name => _name;
  int get mobileNum => _mobileNum;
  String get password => _password;
  double get balance => _balance;
  int get level => _level;
  int get referredBy => _referredBy;
  int get undersignedOf => _undersignedOf;
  String get status => _status;
  bool get admin => _admin;

  Data({
      dynamic id, 
      String? name,
      int? mobileNum,
      String? password,
      double? balance,
      int? level,
      int? referredBy,
      int? undersignedOf,
      String? status,
      bool? admin}){
    _id = id;
    _name = name!;
    _mobileNum = mobileNum!;
    _password = password!;
    _balance = balance!;
    _level = level!;
    _referredBy = referredBy!;
    _undersignedOf = undersignedOf!;
    _status = status!;
    _admin = admin!;
}

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _mobileNum = json["mobileNum"];
    _password = json["password"];
    _balance = json["balance"];
    _level = json["level"];
    _referredBy = json["referredBy"];
    _undersignedOf = json["undersignedOf"];
    _status = json["status"];
    _admin = json["admin"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["mobileNum"] = _mobileNum;
    map["password"] = _password;
    map["balance"] = _balance;
    map["level"] = _level;
    map["referredBy"] = _referredBy;
    map["undersignedOf"] = _undersignedOf;
    map["status"] = _status;
    map["admin"] = _admin;
    return map;
  }

}