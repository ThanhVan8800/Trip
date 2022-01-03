import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbtc_trip/src/resources2/main_interface.dart';
import 'package:sbtc_trip/src/resources/login_page.dart';
import 'package:sbtc_trip/src/resources/personal_page.dart';
import 'package:sbtc_trip/src/resources/screen_main.dart';
import 'package:sbtc_trip/src/resources/setting_user.dart';
import 'package:sbtc_trip/src/resources/information_tab.dart';
import 'package:sbtc_trip/src/resources/edit_info.dart';
import 'package:sbtc_trip/src/resources/register.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GiaoDien1(),
    );
  }
}
