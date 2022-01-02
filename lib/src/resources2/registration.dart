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

var img_bg = AssetImage('assets/img/h2.jpg');

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
            ),
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
            ],
          ),
        ));
  }
}
