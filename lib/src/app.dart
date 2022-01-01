import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbtc_trip/src/resources/giaodien9.dart';
import 'package:sbtc_trip/src/resources/login_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GiaoDien1(),
    );
  }
}
