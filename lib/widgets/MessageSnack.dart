import 'package:flutter/material.dart';

class Message {
  static void afficherSnack(BuildContext context, String msg,
      [Color color = Colors.red]) {
    final scaffold = ScaffoldMessenger.of(context);
    var snackbar = SnackBar(
      backgroundColor: color,
      content: Text(msg),
    );
    scaffold.showSnackBar(snackbar);
  }

  static void lancerChargementDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("Traitement en cours..."),
        );
      },
    );
  }

  static void afficherOverlay(
      BuildContext context, String message, String imagePath) {
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          top: 50,
          left: 30,
          right: 30,
          child: Material(
            elevation: 4.0,
            child: Container(
              padding: EdgeInsets.all(16.0),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Row(
                children: [
                  Image.asset(
                    "images/image1.png",
                    width: 24.0,
                    height: 24.0,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    message,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(overlayEntry);
    Future.delayed(Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}
