import 'package:app_pointer/widgets/Chargement.dart';
import 'package:flutter/material.dart';
import 'package:app_pointer/utils/ColorPage.dart';
import 'package:app_pointer/widgets/ChampSaisie.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:app_pointer/authentification/AuthentificationController.dart';
import '../widgets/MessageSnack.dart';

class ChangerPasswordPage extends StatefulWidget {
  const ChangerPasswordPage({super.key});

  @override
  State<ChangerPasswordPage> createState() => _ChangerPasswordPageState();
}

class _ChangerPasswordPageState extends State<ChangerPasswordPage> {
  bool isVisible = false;
  TextEditingController _ancien = TextEditingController();
  TextEditingController _nouveau = TextEditingController();
  TextEditingController _confirmer = TextEditingController();
  GetStorage stockage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Changer mon mot de passe",
          style: TextStyle(
              color: ColorPages.COLOR_BLANCHE,
              fontFamily: 'Schyler',
              fontSize: 19),
        ),
        backgroundColor: ColorPages.COLOR_PRINCIPAL,
      ),
      body: Stack(
        children: [_body(context), Chargement(isVisible)],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [_champs(), _button()],
    );
  }

  Widget _champs() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: ChampSaisie(
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "votre ancien mot de passe*";
                  }
                  if (value.length < 8) {
                    return 'votre mot de passe doit comporter au moins 8 caractères*';
                  }
                  return null;
                },
                ctrl: _ancien,
                label: "Ancien  mot de passe",
                prefixIcon: Icons.lock,
                type: TextInputType.text,
                isPassword: true,
                required: true),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: ChampSaisie(
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "votre nouveau mot de passe*";
                  }
                  if (value.length < 8) {
                    return 'votre nouveau mot de passe doit comporter au moins 8 caractères*';
                  }
                  return null;
                },
                ctrl: _nouveau,
                label: "Nouveau  mot de passe",
                prefixIcon: Icons.lock,
                type: TextInputType.text,
                isPassword: true,
                required: true),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: ChampSaisie(
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Confirmer votre mot de passe*";
                  }
                  if (value.length < 8) {
                    return 'votre mot de passe doit comporter au moins 8 caractères*';
                  }
                  return null;
                },
                ctrl: _confirmer,
                label: "Confirmer  mot de passe",
                prefixIcon: Icons.lock,
                type: TextInputType.text,
                isPassword: true,
                required: true),
          ),
        ],
      ),
    );
  }

  Widget _button() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Row(
              children: [
                Container(
                  width: 150,
                  height: 50,
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Annuler",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: ColorPages.COLOR_PRINCIPAL)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPages.COLOR_TRANSPARENT,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
                Container(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Changer",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: ColorPages.COLOR_BLANCHE),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPages.COLOR_NOIR,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
