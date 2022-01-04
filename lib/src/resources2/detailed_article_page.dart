import 'package:flutter/material.dart';
import 'package:sbtc_trip/src/resources/login_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sbtc_trip/src/resources2/Share_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: appTheme,
    title: "Màn hình chính",
  ));
}

ThemeData appTheme =
    ThemeData(primaryColor: Colors.purple, secondaryHeaderColor: Colors.blue);
int sel = 0;
double? width;
double? height;
final bodies = [detailed_article()];

class detailed extends StatefulWidget {
  detailed({Key? key}) : super(key: key);

  detailedState createState() => detailedState();
}

class detailedState extends State<detailed> {
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
        label: "Explore"));
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.favorite,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.favorite,
          color: Colors.black,
        ),
        label: "WishList"));
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
        label: "Notifications"));
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

class detailed_article extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return detailed_articleState();
  }
}

class detailed_articleState extends State<detailed_article> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade300,
        title: Text(
          'Chi tiết bài viết',
          style: TextStyle(fontFamily: "DancingScript", color: Colors.blue),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            'Mộng Bờ Tây',
            style: TextStyle(),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        hoverElevation: 0,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Share_page()));
        },
        child: Icon(Icons.share),
        backgroundColor: appTheme.primaryColor.withOpacity(.5),
      ),
    );
  }
}
