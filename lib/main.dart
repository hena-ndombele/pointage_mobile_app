import 'package:app_pointer/utils/ColorPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'apps/MonApplication.dart';



Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: ColorPages.COLOR_TRANSPARENT),
  );
  await GetStorage.init();

  initializeDateFormatting().then((_) => runApp(MonApplication()));
}