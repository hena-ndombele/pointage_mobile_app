import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:app_pointer/utils/Routes.dart';
import 'package:app_pointer/qrcode/QrCodeController.dart';
import 'package:app_pointer/widgets/Message.dart';

class QrCodePage extends StatefulWidget {
  final String type;

  QrCodePage({Key? key, required this.type}) : super(key: key);

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  bool flashOn = false;
  bool frontCam = false;
  GlobalKey qrKey = GlobalKey();
  QRViewController? qrController;
  String? resultScan;
  String? wifiId;
  String _connectionStatus = '';
  final NetworkInfo infoReseau = NetworkInfo();

  @override
  void initState() {
    super.initState();
    _infoConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(
      children: [
        QRView(
            key: qrKey,
            overlay: QrScannerOverlayShape(borderColor: Colors.white),
            onQRViewCreated: (QRViewController controller) {
              this.qrController = controller;
              controller.scannedDataStream.listen((scanData) async {
                resultScan = scanData.code;
                controller.dispose();

                if (widget.type == "Entree") {
                  _gererEntrer(
                      context, _connectionStatus, resultScan, controller);
                } else if (widget.type == "Sortie") {
                  _gererSortie(
                      context, _connectionStatus, resultScan, controller);
                } else {
                  return;
                }
              });
            }),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 45),
            child: Text(
              'Présence',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  color: Colors.white,
                  icon: Icon(flashOn ? Icons.flash_on : Icons.flash_off),
                  onPressed: () {
                    setState(() {
                      flashOn = true;
                    });
                    qrController!.toggleFlash();
                  }),
              IconButton(
                  color: Colors.white,
                  icon: Icon(frontCam ? Icons.camera_front : Icons.camera_rear),
                  onPressed: () {
                    setState(() {
                      frontCam = true;
                    });
                    qrController!.flipCamera();
                  }),
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        )
      ],
    );
  }

  Future<void> _gererEntrer(BuildContext context, String bssid,
      dynamic resultScan, controller) async {
    var presenceCtrl = context.read<QrCodeController>();
    var result =
        await presenceCtrl.setPresenceApi(resultScan!, {'bssid': bssid});

    if (!resultScan.contains('scan') || !resultScan.contains('Arrive')) {
      showMsg(context, false, "QR Code invalide");
      controller.dispose();
    } else {
      switch (result.data!['message']) {
        case "Presence enregistre":
          showMsg(context, true, "Vous avez marquer votre entrée");
          controller.dispose();
          Navigator.pop(context);
          break;
        case "Presence deja enregistre":
          showMsg(context, false, "Votre avez déjà marquer votre présence");
          controller.dispose();
          break;
        case "Reseau non autorise":
          showMsg(context, false, "Réseau non autorisé");
          controller.dispose();
          break;
        default:
          controller.dispose();
      }
    }
  }

  Future<void> _gererSortie(BuildContext context, String bssid,
      dynamic resultScan, controller) async {
    var DepartCtrl = context.read<QrCodeController>();
    var result = await DepartCtrl.setDepartApi(resultScan!, bssid);

    if (!resultScan.contains('scan') || !resultScan.contains('Depart')) {
      showMsg(context, false, "QR Code invalide");
      controller.dispose();
    } else {
      switch (result.data!['message']) {
        case "Depart enregistre":
          showMsg(context, true, "Vous avez marquer votre sortie");
          controller.dispose();

          Navigator.pop(context);
          break;
        case "Depart deja enregistre":
          showMsg(context, false, "Vous avez déjà marquer votre sortie");
          controller.dispose();
          break;
        case "Reseau non autorise":
          showMsg(context, false, "Réseau non autorisé");
          controller.dispose();
          break;
        default:
          controller.dispose();
      }
    }
  }

  Future<void> _infoConnection() async {
    wifiId = await infoReseau.getWifiBSSID();
    _connectionStatus = '$wifiId';
    print('fffffffffffffffffffffffffffffffffff $wifiId');
    print("ooooooooooooooooooooooooooooooooooo $_connectionStatus");
  }
}
