import 'package:flutter/material.dart';
import 'package:sbtc_trip/src/resources/screen_main.dart';
import 'package:cached_network_image_web/cached_network_image_web.dart';

class recommen extends StatefulWidget {
  const recommen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return recommenState();
  }
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passController = TextEditingController();

var img_bg = AssetImage('assets/img/h3.jpg');

class recommenState extends State<recommen> {
  @override
  Widget build(BuildContext context) {
    precacheImage(img_bg, context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade300,
          title: Text(
            'Đề Xuất Địa Danh Mới',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: "DancingScript",
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
                      border: OutlineInputBorder(), labelText: 'Tên Địa Danh'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Địa chỉ Địa Danh'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Kinh Độ'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Vĩ Độ'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Thông Tin Địa danh'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Hình Ảnh Địa Danh'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BottomNav()));
                  },
                  style: OutlinedButton.styleFrom(
                    elevation: 8,
                    shadowColor: Colors.blue,
                    side: BorderSide(color: Colors.blue),
                  ),
                  child: Text(
                    'Đề Xuất Địa Danh',
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
