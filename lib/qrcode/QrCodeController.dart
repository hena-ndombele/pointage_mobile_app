import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_pointer/qrcode/QrCodeModel.dart';
import 'package:app_pointer/utils/StockagesKeys.dart';
import 'package:app_pointer/utils/StockagesKeys.dart';

import '../utils/Endpoints.dart';
import '../utils/Requettes.dart';

class QrCodeController with ChangeNotifier {
  List<QrCodeModel> presenceList = [];
  bool loading = false;
  GetStorage? stockage;
  int? _presence_id;

  QrCodeController({this.stockage});

  void getPresenceApi() async {
    var url = "${Endpoints.presences}";
    loading = true;
    notifyListeners();

    var tkn = stockage?.read(StockageKeys.tokenKey);
    var reponse = await getData(url, token: tkn);
    print("Résultat de la réccupération ${reponse}");

    if (reponse != null) {
      List<QrCodeModel> presence =
          reponse.map<QrCodeModel>((e) => QrCodeModel.fromJson(e)).toList();
      presenceList = presence;
      stockage?.write(StockageKeys.present, reponse);
      notifyListeners();
    } else {
      var presentLocal = stockage?.read(StockageKeys.present);
      var temp =
          presentLocal.map<QrCodeModel>((e) => QrCodeModel.fromJson(e)).toList;
      presenceList = temp;
      print("data satockee :${temp}");
    }
    loading = false;
    notifyListeners();
  }

  Future<HttpResponse> setPresenceApi(String api_url, Map data) async {
    var _token = stockage?.read(StockageKeys.tokenKey);
    var reponse = await postData(api_url, data, token: _token);

    if (reponse.status) {
      _presence_id = reponse.data!['id'];
      stockage?.write(StockageKeys.presenceKey, _presence_id);
      notifyListeners();
    }
    return reponse;
  }

  Future<HttpResponse> setDepartApi(String api_url, String bssid) async {
    int presence_id = _presence_id ?? stockage?.read(StockageKeys.presenceKey);
    Map data = {"id": presence_id, "bssid": bssid};
    var _token = stockage?.read(StockageKeys.tokenKey);
    var reponse = await patchData(api_url, data, token: _token);

    if (reponse.status) {
      stockage?.remove(StockageKeys.presenceKey);
      notifyListeners();
    }
    return reponse;
  }
}

void main() {
  var test = QrCodeController();
  test.getPresenceApi();
}
