import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbtc_trip/src/resources2/main_interface.dart';
import 'package:sbtc_trip/src/resources/login_page.dart';
import 'package:sbtc_trip/src/resources/screen_main.dart';
import 'package:sbtc_trip/src/resources2/recommendation_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: GiaoDien1(),
      home: BottomNav(),
    );
  }
}
