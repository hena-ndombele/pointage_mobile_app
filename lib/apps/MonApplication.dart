import 'package:app_pointer/authentification/AuthentificationController.dart';
import 'package:app_pointer/deconnexion/DeconnexionController.dart';
import 'package:app_pointer/information/InformationController.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_pointer/qrcode/QrCodeController.dart';
import '../utils/RoutesManager.dart';
import 'package:provider/provider.dart';
import '../utils/Routes.dart';
import 'package:app_pointer/utils/StockagesKeys.dart';


class MonApplication extends StatelessWidget {
  var _stockage = GetStorage();

  @override
  Widget build(BuildContext context) {

    var token=_stockage.read(StockageKeys.tokenKey);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AuthentificationController(stockage:_stockage)),
        ChangeNotifierProvider(create: (_) => QrCodeController(stockage: _stockage)),
        ChangeNotifierProvider(create: (_)=>DeconnexionCtrl(stockage: _stockage)),
        ChangeNotifierProvider(create: (_)=>InformationCtrl(stockage: _stockage)),
          ],
      child: MaterialApp(
        theme: ThemeData(appBarTheme: AppBarTheme(iconTheme: IconThemeData(color:Colors.white))),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.route,
        initialRoute: Routes.SplaShreen,
      ),
    );
  }
}
