import 'package:flutter/material.dart';
import 'package:sbtc_trip/src/resources2/registration.dart';
import 'package:sbtc_trip/src/resources/login_page.dart';
import 'package:cached_network_image_web/cached_network_image_web.dart';

class GiaoDien1 extends StatefulWidget {
  const GiaoDien1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GiaoDien1State();
  }
}

var img_bg = AssetImage('assets/img/h2.jpg');

class GiaoDien1State extends State<GiaoDien1> {
  @override
  Widget build(BuildContext context) {
    precacheImage(img_bg, context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'App StripCase',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
                letterSpacing: 5,
                fontFamily: "DancingScript"),
          ),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(image: img_bg, fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  style: OutlinedButton.styleFrom(
                    elevation: 8,
                    shadowColor: Colors.blue,
                    side: BorderSide(color: Colors.blue),
                  ),
                  child: Text(
                    'Đăng Nhập',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: "DancingScript",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DangKy()));
                  },
                  style: OutlinedButton.styleFrom(
                    elevation: 8,
                    shadowColor: Colors.blue,
                    side: BorderSide(color: Colors.blue),
                  ),
                  child: Text(
                    'Đăng Ký',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: "DancingScript",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
