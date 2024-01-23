import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:app_pointer/information/InformationController.dart';
import 'package:app_pointer/information/informationModel.dart';
import 'package:app_pointer/utils/ColorPage.dart';
import 'package:intl/intl.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  InformationModel agent = InformationModel();
  GetStorage stockage = GetStorage();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var infoCtrl = context.read<InformationCtrl>();
      infoCtrl.informationAgent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Mes Informations",
          style: TextStyle(color: Colors.white, fontFamily: "Schyler"),
        ),
        backgroundColor: ColorPages.COLOR_PRINCIPAL,
      ),
      body: Stack(
        children: [
          _body(context),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    var infoCtrl = context.watch<InformationCtrl>();

    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(
                        "Nom :",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Schyler',
                        ),
                      ),
                      Text(
                        ' ${infoCtrl.infosAgent?.nom ?? ""}',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                height: 15,
                color: ColorPages.COLOR_GRIS,
              ),
              Container(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(
                        "Postnom :",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Schyler',
                        ),
                      ),
                      Text(
                        ' ${infoCtrl.infosAgent?.postnom ?? ""}',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                height: 15,
                color: ColorPages.COLOR_GRIS,
              ),
              Container(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(
                        "Prénom :",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Schyler',
                        ),
                      ),
                      Text(
                        ' ${infoCtrl.infosAgent?.prenom ?? ""}',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                height: 15,
                color: ColorPages.COLOR_GRIS,
              ),
              Container(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(
                        "Service :",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Schyler',
                        ),
                      ),
                      Text(
                        ' ${infoCtrl.infosAgent?.service ?? ""}',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                height: 15,
                color: ColorPages.COLOR_GRIS,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      "Direction :",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Schyler',
                      ),
                    ),
                    Text(' ${infoCtrl.infosAgent?.direction ?? ""}')
                  ],
                ),
              ),
              Divider(
                height: 15,
                color: ColorPages.COLOR_GRIS,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      "Département :",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Schyler',
                      ),
                    ),
                    Text(' ${infoCtrl.infosAgent?.departement ?? ""}')
                  ],
                ),
              ),
              Divider(
                height: 15,
                color: ColorPages.COLOR_GRIS,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      "Matricule :",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Schyler',
                      ),
                    ),
                    Text(' ${infoCtrl.infosAgent?.matricule ?? ""}')
                  ],
                ),
              ),
              Divider(
                height: 15,
                color: ColorPages.COLOR_GRIS,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      "Grade :",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Schyler',
                      ),
                    ),
                    Text(' ${infoCtrl.infosAgent?.grade ?? ""}')
                  ],
                ),
              ),
              Divider(
                height: 15,
                color: ColorPages.COLOR_GRIS,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      "Date d'embauche :",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Schyler',
                      ),
                    ),
                    Text(
                        'Le  ${infoCtrl.infosAgent?.dateE?.day ?? ""}-${infoCtrl.infosAgent?.dateE?.month ?? ""}-${infoCtrl.infosAgent?.dateE?.year ?? ""}')
                  ],
                ),
              ),
              Divider(
                height: 15,
                color: ColorPages.COLOR_GRIS,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      "Superviseur :",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Schyler',
                      ),
                    ),
                    Text(' ${infoCtrl.infosAgent?.superviseur ?? ""}')
                  ],
                ),
              ),
              Divider(
                height: 15,
                color: ColorPages.COLOR_GRIS,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      "Etat Civil :",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Schyler',
                      ),
                    ),
                    Text(' ${infoCtrl.infosAgent?.etatCivil ?? ""}')
                  ],
                ),
              ),
              Divider(
                height: 15,
                color: ColorPages.COLOR_GRIS,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      "Date de naissance :",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Schyler',
                      ),
                    ),
                    Text(
                        'Le  ${infoCtrl.infosAgent?.dateN?.day ?? ""}-${infoCtrl.infosAgent?.dateN?.month ?? ""}-${infoCtrl.infosAgent?.dateN?.year ?? ""}')
                  ],
                ),
              ),
              Divider(
                height: 15,
                color: ColorPages.COLOR_GRIS,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      "N°téléphone :",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Schyler',
                      ),
                    ),
                    Text(' ${infoCtrl.infosAgent?.numero ?? ""}')
                  ],
                ),
              ),
              Divider(
                height: 15,
                color: ColorPages.COLOR_GRIS,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      "Adresse :",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Schyler',
                      ),
                    ),
                    Text(' ${infoCtrl.infosAgent?.adresse ?? ""}')
                  ],
                ),
              ),
              Divider(
                height: 15,
                color: ColorPages.COLOR_GRIS,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      "Niveau d'étude :",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Schyler',
                      ),
                    ),
                    Text(' ${infoCtrl.infosAgent?.niveauEtude ?? ""}')
                  ],
                ),
              ),
              Divider(
                height: 15,
                color: ColorPages.COLOR_GRIS,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      "Nbre d'enfants :",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Schyler',
                      ),
                    ),
                    Text(' ${infoCtrl.infosAgent?.nombreE ?? ""}')
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
