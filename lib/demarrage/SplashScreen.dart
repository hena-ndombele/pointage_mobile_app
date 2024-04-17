import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:app_pointer/authentification/AuthentificationController.dart';
import 'package:app_pointer/authentification/AuthentificationPage.dart';
import 'package:app_pointer/utils/ColorPage.dart';
import 'package:app_pointer/utils/Routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var ctrl = context.read<AuthentificationController>();
      Future.delayed(Duration(seconds: 4), () {
        var _tkn = ctrl.token;
        print("gggggggggggggggggggggg$_tkn");
        Navigator.pushReplacementNamed(context,
            _tkn.isNotEmpty ? Routes.BottomNavBar : Routes.Authentification);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPages.COLOR_PRINCIPAL,
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.only(top: 250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 170,
                width: 270,
                child: Image.asset("images/image1.png"),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 130),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: Text('version 1.0.0',
                                style: TextStyle(
                                    color: ColorPages.COLOR_BLANCHE,fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
