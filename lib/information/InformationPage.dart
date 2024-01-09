import 'package:flutter/material.dart';
import 'package:app_pointer/utils/ColorPage.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mes Informations",
          style:
              TextStyle(color: ColorPages.COLOR_BLANCHE, fontFamily: 'Schyler'),
        ),
        backgroundColor: ColorPages.COLOR_PRINCIPAL,
      ),
    );
  }
}
