import 'package:app_pointer/changerPassword/ChangerPasswordPage.dart';
import 'package:app_pointer/demarrage/HomePage.dart';
import 'package:app_pointer/information/InformationPage.dart';
import 'package:app_pointer/profile/ProfilePage.dart';
import 'package:app_pointer/qrcode/QrCodePage.dart';
import 'package:flutter/material.dart';
import 'package:app_pointer/utils/Routes.dart';

import '../authentification/AuthentificationPage.dart';

class RoutesManager {
  static Route route(RouteSettings r) {
    switch (r.name) {
      case Routes.HomePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.Authentification:
        return MaterialPageRoute(builder: (_) => AuthentificationPage());
      case Routes.ProfilePage:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case Routes.ChangerPassword:
        return MaterialPageRoute(builder: (_)=>ChangerPasswordPage());
      case Routes.InformationPage:
        return MaterialPageRoute(builder: (_)=>InformationPage());
      case Routes.QrCodeScannerRoute:
        String _type = (r.arguments as String?) ?? "Entree"; //Sortie
        return MaterialPageRoute(
            builder: (_) => QrCodePage(
                  type: _type,
                ));

      default:
        return MaterialPageRoute(builder: (_) => AuthentificationPage());
    }
  }
}
