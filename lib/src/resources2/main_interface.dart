import 'package:flutter/material.dart';
import 'package:sbtc_trip/src/resources/register.dart';
import 'package:sbtc_trip/src/resources/login_page.dart';

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
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: BoxConstraints.expand(),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(image: img_bg, fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 140,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 120, 0, 20),
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
                        MaterialPageRoute(builder: (context) => Register()));
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
