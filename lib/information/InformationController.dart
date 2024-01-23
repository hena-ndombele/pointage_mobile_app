import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_pointer/information/informationModel.dart';
import 'package:app_pointer/utils/EndPoints.dart';
import 'package:app_pointer/utils/StockagesKeys.dart';
import 'package:app_pointer/utils/Requettes.dart';

class InformationCtrl with ChangeNotifier {
  InformationCtrl({this.stockage});

  GetStorage? stockage;

  InformationModel? infosAgent;
  bool loading = false;

  void informationAgent() async {
    var url = "${Endpoints.information}";
    loading = true;
    notifyListeners();
    var tkn = stockage?.read(StockageKeys.tokenKey);
    //var tkn="5|UwAsN0VJov7LbE8FoDhNgr4UISJN7skpCl2s06YA";
    var response = await getData(url, token: tkn);
    print("ddddddddddddddddddddddddddddddd $response");
    if (response != null) {
      infosAgent = InformationModel.fromJson(response);

      print("============INFO AGENT $infosAgent");
    }
    loading = false;
    notifyListeners();
  }
}

void main() {
  var ctrl = InformationCtrl();
  ctrl.informationAgent();
}
