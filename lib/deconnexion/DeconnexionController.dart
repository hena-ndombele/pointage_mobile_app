
import 'package:app_pointer/authentification/AuthentificationModel.dart';
import 'package:app_pointer/utils/Requettes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/EndPoints.dart';
import '../utils/StockagesKeys.dart';

class DeconnexionCtrl with ChangeNotifier {
  DeconnexionCtrl({this.stockage});

  String _token = "";

  String get token {
    var locale = stockage?.read<String>(StockageKeys.tokenKey);
    return locale ?? "";
  }

  set token(String value) {
    stockage?.write(StockageKeys.tokenKey, value);
    _token = value;
  }

  AuthentificationModel _user = AuthentificationModel();
  GetStorage? stockage;

  List<AuthentificationModel> auth = [];
  bool loading = false;

  AuthentificationModel get user {
    var locale = stockage?.read(StockageKeys.userKey);
    _user = AuthentificationModel.fromJson(locale);
    return _user;
  }

  set user(AuthentificationModel value) {
    stockage?.write(StockageKeys.userKey, value.toJson());
    _user = value;
  }
  Future<HttpResponse> logout(Map data) async {
  var url = "${Endpoints.logout}";
  var tkn = stockage?.read(StockageKeys.tokenKey);
  HttpResponse response = await postData(url, data, token: tkn);
  if (response.status) {
    notifyListeners();
  }
  print(response.data);

  return response;
}}