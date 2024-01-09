import 'package:flutter/material.dart';
import 'package:app_pointer/utils/ColorPage.dart';

Widget Chargement([bool isVisible=false] ){
  return Visibility(
    visible: isVisible,
    child: Align(
        alignment: Alignment.center,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          //color: Colors.grey.withOpacity(0.4),
          color: Colors.black87,
          child: Center(
            child: CircularProgressIndicator(color: ColorPages.COLOR_PRINCIPAL,),
          ),
        )
    ),
  ) ;
}