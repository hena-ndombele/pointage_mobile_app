import 'package:app_pointer/widgets/Chargement.dart';
import 'package:flutter/material.dart';
import 'package:app_pointer/utils/ColorPage.dart';
import 'package:app_pointer/widgets/ChampSaisie.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      children: [_champs(), _bouton()],
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

  Widget _bouton() {
    return Expanded(
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
    );
  }
}
