import 'package:flutter/material.dart';
import 'package:sbtc_trip/src/resources/login_page.dart';
import 'package:cached_network_image_web/cached_network_image_web.dart';

class DangKy extends StatefulWidget {
  const DangKy({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DangKyState();
  }
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passController = TextEditingController();

var img_bg = AssetImage('assets/img/h3.jpg');

class DangKyState extends State<DangKy> {
  @override
  Widget build(BuildContext context) {
    precacheImage(img_bg, context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Đăng Ký Tài Khoản',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: "DancingScript",
            ),
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
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nhập tên tài khoản'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Nhập mật khẩu'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nhập lại mật khẩu'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nhập Số Điện Thoại'),
                ),
              ),
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
                    'Đăng Ký',
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                child: RichText(
                  text: TextSpan(
                      text: "Already a User? ",
                      style: TextStyle(color: Color(0xff606470), fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Login now",
                            style: TextStyle(
                                color: Color(0xff3277D8), fontSize: 16))
                      ]),
                ),
              )
            ],
          ),
        ));
  }
}
