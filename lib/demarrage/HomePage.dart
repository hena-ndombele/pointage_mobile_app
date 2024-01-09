import 'package:app_pointer/utils/ColorPage.dart';
import 'package:flutter/material.dart';

import '../utils/Routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPages.COLOR_PRINCIPAL,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 280,
            ),
            Container(
                width: 250,
                height: 65,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.QrCodeScannerRoute,
                      arguments: 'Entree',
                    );
                  },
                  child: Text("ENTREE",
                      style: TextStyle(
                          color: ColorPages.COLOR_PRINCIPAL,
                          fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            Container(
                width: 250,
                height: 65,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.QrCodeScannerRoute,
                      arguments: 'Sortie',
                    );
                  },
                  child: Text("SORTIE",
                      style: TextStyle(
                          color: ColorPages.COLOR_PRINCIPAL,
                          fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            Container(
                width: 250,
                height: 65,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.ProfilePage);
                  },
                  child: Text(
                    "MON PROFILE",
                    style: TextStyle(
                        color: ColorPages.COLOR_PRINCIPAL,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                )),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Text('version 1.0.0',
                              style: TextStyle(
                                  color: ColorPages.COLOR_BLANCHE,
                                  fontWeight: FontWeight.bold,
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
    );
  }
}
