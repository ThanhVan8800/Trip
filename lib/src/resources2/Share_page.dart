import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sbtc_trip/src/resources/screen_main.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: appTheme,
    title: "Màn hình chính",
  ));
}

ThemeData appTheme =
    ThemeData(primaryColor: Colors.blue, secondaryHeaderColor: Colors.yellow);
int sel = 0;
double? width;
double? height;
final bodies = [Share_page()];

class BottomNav4 extends StatefulWidget {
  BottomNav4({Key? key}) : super(key: key);

  _BottomNav4State createState() => _BottomNav4State();
}

class _BottomNav4State extends State<BottomNav4> {
  List<BottomNavigationBarItem> createItems() {
    List<BottomNavigationBarItem> items = [];
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.home,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.home,
          color: Colors.black,
        ),
        label: "Màn hình chính"));
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.favorite,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.favorite,
          color: Colors.black,
        ),
        label: "Yêu thích"));
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.local_offer,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.info_outlined,
          color: Colors.black,
        ),
        label: "Deals"));
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.notifications,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.verified_user_outlined,
          color: Colors.black,
        ),
        label: "User"));
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodies.elementAt(sel),
      bottomNavigationBar: BottomNavigationBar(
        items: createItems(),
        unselectedItemColor: Colors.black,
        selectedItemColor: appTheme.primaryColor,
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        currentIndex: sel,
        elevation: 1.5,
        onTap: (int index) {
          if (index != sel)
            setState(() {
              sel = index;
            });
        },
      ),
    );
  }
}

class Share_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Share_pageState();
  }
}

class Share_pageState extends State<Share_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade300,
        title: Text(
          'Chia Sẽ Bài Viết',
          style: TextStyle(
            color: Colors.blue,
            fontFamily: "DancingScript",
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Cảm Nghĩ :'),
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
                'Chia Sẽ Bài Viết',
                style: TextStyle(fontSize: 28),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
