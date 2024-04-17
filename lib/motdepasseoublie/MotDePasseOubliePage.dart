import 'package:flutter/material.dart';
import 'package:app_pointer/utils/ColorPage.dart';
import 'package:app_pointer/widgets/ChampSaisie.dart';
import 'package:app_pointer/widgets/Chargement.dart';

class PasswordOublie extends StatefulWidget {
  const PasswordOublie({super.key});

  @override
  State<PasswordOublie> createState() => _PasswordOublieState();
}

class _PasswordOublieState extends State<PasswordOublie> {
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _body()
        ],
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [_text(),
        SizedBox(height: 50,),
        _champ(), _bouton()],
    );
  }

  Widget _text() {
    return Container(
      child: Text(
        "Mot de passe oublié?",
        style: TextStyle(
            color: ColorPages.COLOR_NOIR, fontWeight: FontWeight.bold,fontSize: 25),
      ),
    );
  }
  Widget _champ() {
    return Container(
      child: ChampSaisie(
        label: "Email",
        hintext: "Entrez votre adresse mail",
        ctrl: _email,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "votre adresse email*";
          }
          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
            return 'Entrez une adresse mail valide*';
          }
          return null;
        },
      ),
    );
  }
  Widget _bouton() {
    return Container(
        child: ElevatedButton(
            onPressed: () {}, child: Text("Réinitialiser le mot de passe")));
  }
}
