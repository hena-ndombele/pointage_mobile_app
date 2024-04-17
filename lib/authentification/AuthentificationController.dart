import 'package:flutter/material.dart';
import 'package:app_pointer/authentification/AuthentificationModel.dart';
import 'package:app_pointer/utils/EndPoints.dart';
import 'package:app_pointer/utils/Requettes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_pointer/utils/StockagesKeys.dart';

class AuthentificationController with ChangeNotifier {
  AuthentificationController({this.stockage});

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
  } //gestion de cas d'erreur

  Future<HttpResponse> login(Map data) async {
    var url = "${Endpoints.authentificationEndpoint}";
    HttpResponse response = await postData(url, data);
    if (response.status ) {
      var temp_user = response.data?["data"]["user"] ?? {};
      user = AuthentificationModel.fromJson(temp_user);
      stockage?.write(
          StockageKeys.tokenKey, response.data?["data"]["token"] ?? "");
      notifyListeners();
    }
    print(response.data);
    return response;
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
  }

  Future<HttpResponse> changerPassword(Map data) async {
    var url = "${Endpoints.changerPassword}";
    var tkn = stockage?.read(StockageKeys.tokenKey);
    HttpResponse response = await postData(url, data, token: tkn);
    if (response.status) {
      notifyListeners();
    } else {
      print("Erreur lors du changement de mot de passe : ${response.data}");
    }
    return HttpResponse(status: response.status, data: response.data);
  }
}
