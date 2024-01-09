import 'package:app_pointer/authentification/AuthentificationController.dart';
import 'package:app_pointer/deconnexion/DeconnexionController.dart';
import 'package:app_pointer/widgets/Chargement.dart';
import 'package:flutter/material.dart';
import 'package:app_pointer/utils/ColorPage.dart';
import 'package:app_pointer/utils/Routes.dart';
import 'package:app_pointer/utils/RoutesManager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../utils/StockagesKeys.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isVisible = false;
  GetStorage stockage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPages.COLOR_PRINCIPAL,
        title: Text(
          'Profil',
          style:
              TextStyle(color: ColorPages.COLOR_BLANCHE, fontFamily: 'Schyler'),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              isVisible = true;
              var auth = context.read<DeconnexionCtrl>();
              auth.logout({});
              setState(() {});
              stockage.remove(StockageKeys.tokenKey);

              Navigator.popAndPushNamed(context, Routes.Authentification);
              await Future.delayed(Duration(seconds: 7));
              isVisible = false;
            },
            color: ColorPages.COLOR_BLANCHE,
            icon: const Icon(Icons.power_settings_new_sharp),
          ),
        ],
      ),
      body: Stack(
        children: [_body(context), Chargement(isVisible)],
      ),
    );
  }

  Widget _body(BuildContext context) {
    var profileCtrl = context.watch<AuthentificationController>();

    return Container(
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          /* Container(
            child: InkWell(
              onTap: () async {},
              child: imageSelectione == null
                  ? CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage(
                  'images/image2.png',
                ),
              )
                  : CircleAvatar(
                radius: 80.0,
                backgroundImage: FileImage(File(imageSelectione!.path)),
              ),
            ),
          ),*/
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              '${profileCtrl.user.name}',
              style: TextStyle(
                  height: 1.5,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                  color: ColorPages.COLOR_NOIR,
                  fontFamily: 'Schyler'),
            ),
          ),
          Container(
            child: Text(
              '${profileCtrl.user.email}',
              style: TextStyle(
                height: 1.5,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: ColorPages.COLOR_GRIS,
                fontFamily: 'Schyler',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView(
                padding: EdgeInsets.all(10),
                shrinkWrap: true,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      //color: Utils.COLOR_BLEU_CIEL,
                    ),
                    child: ListTile(
                        title: Text(
                          'Changer le mot de passe',
                          style: TextStyle(fontSize: 14, fontFamily: 'hena'),
                        ),
                        leading: Icon(
                          Icons.password,
                          color: ColorPages.COLOR_NOIR,
                          size: 24,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: ColorPages.COLOR_NOIR,
                          size: 14,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.ChangerPassword);
                        }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      //color: Utils.COLOR_BLEU_CIEL,
                    ),
                    child: ListTile(
                      title: Text(
                        'Mes Informations',
                        style: TextStyle(fontSize: 14, fontFamily: 'hena'),
                      ),
                      leading: Icon(
                        Icons.person,
                        color: ColorPages.COLOR_NOIR,
                        size: 24,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: ColorPages.COLOR_NOIR,
                        size: 14,
                      ),
                      onTap: () => {
                        Navigator.pushNamed(context, Routes.InformationPage),
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      //color: Utils.COLOR_BLEU_CIEL,
                    ),
                    child: ListTile(
                        title: Text(
                          'A propos',
                          style: TextStyle(fontSize: 14, fontFamily: 'hena'),
                        ),
                        leading: Icon(
                          Icons.info,
                          color: ColorPages.COLOR_NOIR,
                          size: 24,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: ColorPages.COLOR_NOIR,
                          size: 14,
                        ),
                        onTap: () {}),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      //color: Utils.COLOR_BLEU_CIEL,
                    ),
                    child: ListTile(
                      title: Text(
                        'Feedback',
                        style: TextStyle(fontSize: 14, fontFamily: 'hena'),
                      ),
                      leading: Icon(
                        Icons.bookmark,
                        color: ColorPages.COLOR_NOIR,
                        size: 24,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: ColorPages.COLOR_NOIR,
                        size: 14,
                      ),
                      onTap: () {},
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      //color: Utils.COLOR_BLEU_CIEL,
                    ),
                    child: ListTile(
                        title: Text(
                          'Partager',
                          style: TextStyle(fontSize: 14, fontFamily: 'hena'),
                        ),
                        leading: Icon(
                          Icons.share,
                          color: ColorPages.COLOR_NOIR,
                          size: 24,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: ColorPages.COLOR_NOIR,
                          size: 14,
                        ),
                        onTap: () {}),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      //color: Utils.COLOR_BLEU_CIEL,
                    ),
                    child: ListTile(
                        title: Text(
                          'Déconnexion',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'hena',
                              color: ColorPages.COLOR_PRINCIPAL,
                              fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(
                          Icons.login,
                          color: ColorPages.COLOR_PRINCIPAL,
                          size: 24,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: ColorPages.COLOR_PRINCIPAL,
                          size: 14,
                        ),
                        onTap: () async {
                          isVisible = true;
                          var auth = context.read<DeconnexionCtrl>();
                          auth.logout({});
                          //  var notifCtr = context.read<NotificationController>();
                          //  isVisible = true;
                          // notifCtr.shutDown();
                          setState(() {});
                          stockage.remove(StockageKeys.tokenKey);
                          // stockage.remove(StockageKeys.userKey);

                          Navigator.popAndPushNamed(
                              context, Routes.Authentification);
                          await Future.delayed(Duration(seconds: 7));
                          isVisible = false;
                        }),
                  ),
                  SizedBox(height: 20),
                ]),
          ),
        ],
      ),
    );
  }
}
