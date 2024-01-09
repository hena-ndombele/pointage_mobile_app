import 'package:flutter/material.dart';
import 'package:app_pointer/utils/ColorPage.dart';

class ChampSaisie extends StatefulWidget {
  bool isPassword;
  String label = "";
  String hintext = "";
  IconData prefixIcon = Icons.edit;
  TextEditingController ctrl;
  TextInputType type = TextInputType.text;
  bool required = false;

  ChampSaisie(
      {this.isPassword = false,
        this.label = "",
        this.hintext = "",
        this.prefixIcon = Icons.edit,
        required this.ctrl,
        this.type = TextInputType.text,
        this.required = false,
        required String? Function(String? value) validator});

  @override
  State<ChampSaisie> createState() => _ChampSaisieState();
}

class _ChampSaisieState extends State<ChampSaisie> {
  bool hidePassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hidePassword = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: hidePassword,
        controller: widget.ctrl,
        keyboardType: widget.type,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Champs obligatoire*";
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
              onPressed: () {
                hidePassword = !hidePassword;
                setState(() {});
              },
              icon: Icon(
                hidePassword ? Icons.visibility : Icons.visibility_off,
                color: ColorPages.COLOR_PRINCIPAL,
              ))
              : SizedBox(),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: ColorPages.COLOR_PRINCIPAL,
          ),
          labelText: widget.label,
          labelStyle: TextStyle(
              color: ColorPages.COLOR_NOIR,
              fontSize: 12,
              fontFamily: "Schyler"),
          hintText: widget.hintext,
          hintStyle: TextStyle(fontFamily: 'Schyler', fontSize: 12),
          border: _bordure(Colors.grey),
          focusedBorder: _bordure(
            ColorPages.COLOR_PRINCIPAL,
          ),
          errorBorder: _bordure(
            ColorPages.COLOR_PRINCIPAL,
          ),
          enabledBorder: _bordure(
            ColorPages.COLOR_PRINCIPAL,
          ),
          filled: true,
          contentPadding: EdgeInsetsDirectional.fromSTEB(9, 15, 0, 15),
        ));
  }
}

OutlineInputBorder _bordure(Color _color) {
  return OutlineInputBorder(
    borderSide: BorderSide(width: 1, color: _color),
  );
}
