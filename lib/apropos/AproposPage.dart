import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../utils/ColorPage.dart';

class AproposPage extends StatefulWidget {
  const AproposPage({super.key});

  @override
  State<AproposPage> createState() => _AproposPageState();
}

class _AproposPageState extends State<AproposPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "A propos",
            style: TextStyle(color: Colors.white, fontFamily: "Schyler"),
          ),
          backgroundColor: ColorPages.COLOR_PRINCIPAL,
        ),
        body: Builder(builder: (context) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  child: Text(
                    "Version 1.0.0",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        fontFamily: 'Schyler'),
                  ),
                ),
                const SizedBox(height: 20.0),
                InkWell(
                  onTap: () => launchUrl(Uri.parse(
                      'https://hena-ndombele.github.io/Hena-Ndombele/')),
                  child: const Text('Termes & Conditions d\'utilisation',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          fontFamily: 'Schyler')),
                ),
                const SizedBox(height: 30.0),
                InkWell(
                  onTap: () => launchUrlString(
                      'https://hena-ndombele.github.io/Hena-Ndombele/',
                      mode: LaunchMode.externalApplication),
                  child: const Text('Visitez le site internet',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          fontFamily: 'Schyler')),
                ),
                const SizedBox(height: 20.0),
                InkWell(
                  onTap: () => contactThankfulPerson(),
                  child: const Text('Contactez le développeur',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          fontFamily: 'Schyler')),
                ),
                Expanded(

                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Row(
                          children: [

                            Expanded(
                              child:Text('Développé par Hena Ndombele',style: TextStyle(color:ColorPages.COLOR_GRIS,fontSize: 13)),
                            ) ],
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
          );
        }));
  }

  Future contactThankfulPerson() async {
    showModalBottomSheet<String?>(
      context: context,
      backgroundColor: Colors.transparent,
      enableDrag: true,
      builder: (context) {
        return Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset('images/wat.jpeg', width: 30),
                    title: Text('Whastapp'),
                    onTap: () =>
                        launchUrl(Uri.parse('https://wa.me/+243830376004')),
                  ),
                  ListTile(
                    leading: Image.asset('images/link.png', width: 30,),
                    title: Text('Linkedin'),
                    onTap: () => launchUrl(
                        Uri.parse('https://www.linkedin.com/in/hena-ndombele')),
                  ),
                  ListTile(
                    leading: Image.asset('images/mail.png', width: 30),
                    title: Text('Email'),
                    onTap: () => launch('mailto:henandombele2021@gmail.com', ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
