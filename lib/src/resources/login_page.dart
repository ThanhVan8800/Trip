import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbtc_trip/src/resources/register.dart';
import 'package:sbtc_trip/src/resources/screen_main.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
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
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 140,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Image.asset(
                  'assets/img/fb.png',
                  width: 150,
                  height: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 6),
                child: Text(
                  'Chào mừng bạn đến với Trip!',
                  style: TextStyle(fontSize: 22, color: Color(0xff333333)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 20),
                child: StreamBuilder(
                  //  stream:,
                  builder: (context, snapshot) => TextField(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        labelText: "Name",
                        prefixIcon: Container(
                            width: 50,
                            child: Image.asset('assets/img/ic_user.png')),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                  ),
                ),
              ),
              StreamBuilder(
                  builder: (context, snapshot) => TextField(
                        obscureText: true,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Container(
                                width: 50,
                                child: Image.asset("assets/img/ic_phone.png")),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffCED0D2), width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)))),
                      )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BottomNav()));
                    },
                    child: Text(
                      "Signin",
                      style:
                          TextStyle(color: Colors.yellowAccent, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(80, 0, 0, 40),
                child: Center(
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Do not have an account? ",
                          style:
                              TextStyle(color: Color(0xff606470), fontSize: 16),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Text("registration now",
                              style: TextStyle(
                                  color: Color(0xff3277D8), fontSize: 16)))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
