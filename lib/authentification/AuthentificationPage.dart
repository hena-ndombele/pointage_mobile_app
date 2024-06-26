import 'package:app_pointer/authentification/AuthentificationController.dart';
import 'package:app_pointer/widgets/Chargement.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_pointer/widgets/ChampSaisie.dart';
import 'package:app_pointer/utils/ColorPage.dart';
import 'package:app_pointer/utils/Routes.dart';
import 'package:app_pointer/widgets/MessageSnack.dart';

import '../widgets/Message.dart';

class AuthentificationPage extends StatefulWidget {
  const AuthentificationPage({Key? key}) : super(key: key);

  @override
  State<AuthentificationPage> createState() => _AuthentificationPageState();
}

class _AuthentificationPageState extends State<AuthentificationPage> {
  @override
  bool isRememberMe = false;
  bool isVisible = false;
  String errorMsg = "";
  bool isPassword = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  LoginPressed() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (!formKey.currentState!.validate()) {
      return;
    }
    isVisible = true;
    setState(() {});
    var ctrl = context.read<AuthentificationController>();
    Map datas = {"email": emailLogin.text, "password": passwordLogin.text};
    print(datas);
    var res = await ctrl.login(datas);
    await Future.delayed(Duration(seconds: 2));
    isVisible = false;
    setState(() {});
    if (res.status) {
      setState(() {});
      Navigator.pushReplacementNamed(context, Routes.BottomNavBar);
    } else {
      passwordLogin.clear();
      var msg = res.isException == true ? res.errorMsg : (res.data?['message']);
      Message.afficherOverlay(context, msg, 'images/image1.png');
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPages.COLOR_PRINCIPAL,
      body: Stack(
        children: [_body(context), Chargement(isVisible)],
      ),
    );
  }
  Widget _body(BuildContext context) {
    return Form(
      key: formKey,
      child: Stack(
        children: [
          //  _logo(),
          _formulaire_widget(),
          _button_widget(),

          // _copyWidget()
        ],
      ),
    );
  }
  Widget _formulaire_widget() {
    return Positioned(
        top: 150,
        child: Container(
          margin: EdgeInsets.all(25),
          child: Container(
            padding: EdgeInsets.all(20),
            height: 400,
            width: MediaQuery.of(context).size.width - 80,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: ColorPages.COLOR_BLANCHE,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: ColorPages.COLOR_NOIR.withOpacity(0.5),
                      blurRadius: 18,
                      spreadRadius: 5)
                ]),
            child: Column(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    child: Image(image: AssetImage("images/image1.png"))),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: ChampSaisie(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "votre adresse email*";
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Entrez une adresse mail valide*';
                      }
                      return null;
                    },
                    label: "Email",
                    ctrl: emailLogin,
                    prefixIcon: Icons.email,
                    type: TextInputType.emailAddress,
                    required: true,
                    isPassword: false,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: ChampSaisie(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "votre mot de passe*";
                        }
                        if (value.length < 8) {
                          return 'votre mot de passe doit comporter au moins 8 caractères*';
                        }
                        return null;
                      },
                      ctrl: passwordLogin,
                      label: "Mot de passe",
                      prefixIcon: Icons.lock,
                      type: TextInputType.text,
                      isPassword: true,
                      required: true),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Text(
                        "Mot de passe oublié?",
                        style: TextStyle(
                            color: ColorPages.COLOR_NOIR,
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.PasswordOubie,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
  Widget _button_widget() {
    return Positioned(
      top: 465,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          width: 200,
          height: 79,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorPages.COLOR_NOIR,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            onPressed: () => LoginPressed(),
            child: Text(
              "Se connecter",
              style: TextStyle(
                  color: ColorPages.COLOR_BLANCHE,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Schyler',
                  fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }




}
