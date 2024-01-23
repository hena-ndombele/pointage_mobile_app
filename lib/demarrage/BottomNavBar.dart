import 'package:app_pointer/historique/HistoriquePage.dart';
import 'package:app_pointer/qrcode/QrCodePage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:app_pointer/utils/ColorPage.dart';
import '../profile/ProfilePage.dart';
import '../utils/Routes.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentTab = 0;
  final List<Widget> screens = [
    ProfilePage(),
    HistoriquePage(),
  ];

  Widget currentScreen = HistoriquePage();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.qr_code_scanner,
          color: ColorPages.COLOR_BLANCHE,
        ),
        backgroundColor: ColorPages.COLOR_ROUGE,
        onPressed: () {
          _ouvrirModalBottomsheet();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          color: Colors.transparent,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = HistoriquePage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month,
                            size: 30,
                            color: currentTab == 0
                                ? ColorPages.COLOR_PRINCIPAL
                                : ColorPages.COLOR_NOIR),
                        Text('Présence',
                            style: TextStyle(
                                color: currentTab == 0
                                    ? ColorPages.COLOR_PRINCIPAL
                                    : ColorPages.COLOR_NOIR))
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ProfilePage();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person,
                            size: 30,
                            color: currentTab == 2
                                ? ColorPages.COLOR_PRINCIPAL
                                : ColorPages.COLOR_NOIR),
                        Text('Moi',
                            style: TextStyle(
                                color: currentTab == 2
                                    ? ColorPages.COLOR_PRINCIPAL
                                    : ColorPages.COLOR_NOIR))
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _ouvrirModalBottomsheet() {
    return showModalBottomSheet(
      context: context,
      // color is applied to main screen when modal bottom screen is displayed
      barrierColor: Colors.black12.withOpacity(.70),
      //background color for modal bottom screen
      backgroundColor: ColorPages.COLOR_BLANCHE,
      //elevates modal bottom screen
      elevation: 10,
      // gives rounded corner to modal bottom screen
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        // UDE : SizedBox instead of Container for whitespaces
        return SizedBox(
          height: 250,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 5,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: ColorPages.COLOR_GRIS,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Pointer votre présence en scannant le code Qr.",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.all(20),
                        width: 150,
                        height: 85,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: ColorPages.COLOR_PRINCIPAL,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                )),
                            onPressed: () {
                              print(
                                  "++++++++++++++++++++++++++++++++++++++++++++");
                              Navigator.pushNamed(
                                context,
                                Routes.QrCodeScannerRoute,
                                arguments: 'Entree',
                              );
                            },
                            child: Text(
                              "Entrée",
                              style: TextStyle(
                                  color: ColorPages.COLOR_BLANCHE,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic),
                            ))),
                    Container(
                        width: 150,
                        height: 85,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: ColorPages.COLOR_NOIR,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                )),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                Routes.QrCodeScannerRoute,
                                arguments: 'Sortie',
                              );
                            },
                            child: Text(
                              "Sortie",
                              style: TextStyle(
                                  color: ColorPages.COLOR_BLANCHE,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic),
                            ))),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
