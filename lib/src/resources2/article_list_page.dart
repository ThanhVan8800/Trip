import 'package:flutter/material.dart';
import 'package:sbtc_trip/src/resources2/detailed_article_page.dart';
import 'package:sbtc_trip/src/resources/screen_main.dart';
import 'package:sbtc_trip/src/resources2/upload_page.dart';
import 'package:sbtc_trip/src/services/Loadpost_Object.dart';
import 'package:sbtc_trip/src/services/Loadpost_Provider.dart';

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
final bodies = [Homerecommendation()];

class BottomNav2 extends StatefulWidget {
  BottomNav2({Key? key}) : super(key: key);

  _BottomNav2State createState() => _BottomNav2State();
}

class _BottomNav2State extends State<BottomNav2> {
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

class Homerecommendation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomerecommendationState();
  }
}

class HomerecommendationState extends State<Homerecommendation> {
  List<LoadPostObject> lsPost = [];
  void _Loadbaiviet() async {
    final data = await LoadPostProvider.getAllLoadPost();
    setState(() {});
    lsPost = data;
  }

  @override
  void initState() {
    super.initState();
    _Loadbaiviet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade300,
        title: Text(
          'Danh Sách Bài Viết',
          style: TextStyle(
            color: Colors.blue,
            fontFamily: "DancingScript",
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: lsPost.length,
          itemBuilder: (context, index) => Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.grey.shade300,
            child: Column(
              children: [
                ListTile(
                  leading: Image.asset(
                    'assets/img/vungtau.png',
                    fit: BoxFit.fill,
                    width: 200,
                  ),
                  title: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => detailed()));
                    },
                    child: Text(
                      ('avc'),
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        hoverElevation: 0,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => upload()));
        },
        child: Icon(Icons.add_box_outlined),
        backgroundColor: appTheme.primaryColor.withOpacity(.5),
      ),
    );
  }
}
