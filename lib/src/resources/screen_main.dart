import 'package:flutter/material.dart';
import 'package:sbtc_trip/src/resources/login_page.dart';
import 'package:url_launcher/url_launcher.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: appTheme,
    title: "Màn hình chính",
  )
  );
}


ThemeData appTheme = ThemeData(
    primaryColor: Colors.purple,
    secondaryHeaderColor: Colors.blue
);
int sel = 0;
double? width;
double? height;
final bodies = [HomeScreen()];



class BottomNav extends StatefulWidget {
  BottomNav({Key? key}) : super(key: key);

  _BottomNavState createState() => _BottomNavState();
}
class _BottomNavState extends State<BottomNav> {
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

class HomeScreen extends StatelessWidget{
  @override
  

  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.shortestSide;
    height = MediaQuery.of(context).size.longestSide;
    double h = 50;
    double w = 50;  
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          hoverElevation: 0,
          onPressed: (){
            showDialog(context: context,
                builder: (context) {
                  return AlertDialog(
                  title:Text("Thông tin liên quan:"),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                onPrimary: Colors.white,
                              ),
                              child: Image.asset('asset/img/gmail.png'),
                              onPressed: () async{
                                const url = 
                                  'mailto:0306191076@caothang.edu.vn@gmail.com?subject=I am using your flutter project so';
                                  if(await canLaunch(url)){
                                    await launch(url);
                                    } else{
                                      throw 'Could not launch $url';
                                    
                                    }
                                  
                              },
                            ),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: SizedBox(
                            height: h,
                            width: w,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                onPrimary: Colors.white,
                              ),
                              child: Image.asset('asset/img/whatsapp.png'),
                              onPressed: () async{
                                const url = '';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                            ),
                          ),
                        )
                    ],
                  )
                  );
                },
             );
          },
          child: Icon(Icons.info_outline),
          backgroundColor: appTheme.primaryColor.withOpacity(.5),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              HomeTop(), homeDown, homeDown
            ],
          ),
        )
    );
  }

}
var selectedloc = 0;
List<String> locs = ['Động Phong Nha', 'Gò Công Town'];

class HomeTop extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomeTop();

}
class _HomeTop extends State<HomeTop>{
  var isFlightselected = true;
  TextEditingController c = TextEditingController(text: locs[1]);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: Clipper08(),
          child: Container(
            height: height! * .65 < 450 ? height! * .65 : 500, //400
            //color: Colors.tealAccent,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              appTheme.primaryColor,
              appTheme.secondaryHeaderColor
            ])),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: height! / 16,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: width! * 0.05,
                      ),
                      PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            selectedloc = int.parse(index.toString());
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              locs[selectedloc],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                        itemBuilder: (BuildContext context) {
                          return <PopupMenuItem<int>>[
                            PopupMenuItem(
                              child: Text(
                                locs[0],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                              value: 0,
                            ),
                            PopupMenuItem(
                              child: Text(
                                locs[1],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                              value: 1,
                            )
                          ];
                        },
                      ),
                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height! / 16,
                ),
                Text(
                  'Địa điểm \n bạn muốn đến',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height! * 0.0375),
                Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: TextField(
                      controller: c,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      cursorColor: appTheme.primaryColor,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 13),
                          suffixIcon: Material(
                            child: InkWell(
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              // onTap: () {
                              //   Navigator.push(context,
                              //       MaterialPageRoute(builder: (context) {
                              //     return SecondPage(
                              //         fromloc: locs[selectedloc],
                              //         toloc: c.text);
                              //   }
                              //   )
                              //   );
                              // },
                            ),
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: height! * 0.025,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: Choice88(
                          icon: Icons.flight_takeoff,
                          text: "Chuyến bay",
                          selected: isFlightselected),
                      onTap: () {
                        setState(() {
                         // isFlightselected = true;
                        });
                      },
                    ),
                    SizedBox(
                      width: width! * 0.055,
                    ),
                    InkWell(
                      child: Choice88(
                          icon: Icons.hotel,
                          text: "Khách sạn",
                          selected: isFlightselected),
                      onTap: () {
                        setState(() {
                         // isFlightselected = false;
                        });
                      },
                    ),
                    SizedBox(
                      width: width! * 0.055,
                    ),
                    InkWell(
                      child: Choice88(
                          icon: Icons.restaurant_menu_outlined,
                          text: "Nhà hàng",
                          selected: isFlightselected),
                      onTap: () {
                        setState(() {
                          //isFlightselected = false;
                        });
                      },
                    )
                  ],
                ),
                SizedBox(height: height! * 0.0375),
               
                Row(
                  
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: Choice88(
                          icon: Icons.flight_takeoff,
                          text: "Chuyến bay",
                          selected: isFlightselected),
                      onTap: () {
                        setState(() {
                         // isFlightselected = true;
                        });
                      },
                    ),
                    SizedBox(
                      width: width! * 0.055,
                    ),
                     InkWell(
                      child: Choice88(
                          icon: Icons.hotel,
                          text: "Khách sạn",
                          selected: isFlightselected),
                      onTap: () {
                        setState(() {
                         // isFlightselected = false;
                        });
                      },
                    ),
                    SizedBox(
                      width: width! * 0.055,
                    ),
                  ]
                )
              ],
            ),
          ),
        )
      ],
    );
  }

}
class Clipper08 extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    final Path path = Path();
    path.lineTo(0.0, size.height);
    var End = Offset(size.width/2, size.height - 30.0);
    var Control = Offset(size.width/4, size.height - 50.0);
    path.quadraticBezierTo(Control.dx, Control.dy, End.dx, End.dy);
    var End2 = Offset(size.width, size.height - 80.0);
    var Control2 = Offset(size.width * .75, size.height - 10.0);
    path.quadraticBezierTo(Control2.dx, Control2.dy, End2.dx, End2.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
class Choice88 extends StatefulWidget{
  final IconData? icon;
  final String? text;
  final bool? selected;
  Choice88({this.icon, this.text, this.selected});
  @override
  State<StatefulWidget> createState() => _Choice88();

}
class _Choice88 extends State<Choice88> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: widget.selected!
        ? BoxDecoration(
          color: Colors.white.withOpacity(.30),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        )
        :null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              widget.icon,
              size: 20,
              color: Colors.white,
            ),
            SizedBox(
              width: width!* .025,
            ),
            Text(
              widget.text!,
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
    );
  }

}
var viewallstyle = 
    TextStyle(fontSize: 14, color: appTheme.primaryColor);
var homeDown = Column(
  children:<Widget>[
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Những địa điểm nổi bật",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Spacer(),
          Text("Xem tất cả", style: viewallstyle)
        ],
      ),
    ),
    Container(
      height: height!* .25 < 170 ? height!* .25 : 170,
      child: ListView.builder(
        itemBuilder: (context, index) => cities[index],
        shrinkWrap: true,
        padding: EdgeInsets.all(0.0),
        itemCount: cities.length,
        scrollDirection: Axis.horizontal,
        ),
    )
  ],
);
List<_City> cities = [
  _City(
    image: "assets/images/Kerman.png",
    name: "Vũng tàu",
    monthyear: "Far 2022",
    oldprice: "25850000",
    newprice: "15000000",
    discount: "58",
  ),
  _City(
    image: "assets/images/Mashhad.png",
    name: "Phú Quốc",
    monthyear: "Far 2022",
    oldprice: "258500",
    newprice: "15000000",
    discount: "58",
  ),
  _City(
    image: "assets/images/Tehran.png",
    name: "Tân Thành Beach",
    monthyear: "Far 2022",
    oldprice: "25850000",
    newprice: "15000000",
    discount: "58",
  ),
];
class _City extends StatelessWidget{
  final String? image, monthyear, oldprice;
  final String? name, discount, newprice;
  const _City(
      {Key? key,
      this.image,
      this.monthyear,
      this.oldprice,
      this.name,
      this.discount,
      this.newprice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  height: height! * .137 < 160 ? height! *.137 : 160,
                  width: width! * .5 < 250 ? width! * .5 : 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:  AssetImage(image!), fit: BoxFit.fill
                    )
                  ),
                ),
              ),
              Positioned(
                height: 60,
                  width: width! * .5 < 250 ? width! * .5 : 250,
                  left: 5,
                  //right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black, Colors.black12],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                  ),
              ),
              Positioned(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            name!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                            Text(
                              monthyear!,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          
                        ],
                      ),
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          discount! + "%",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      )
                  ],
                ),
                left: 10, bottom: 10, right: 15,
              )
            ],
          )
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(  '${(newprice)}' + "\VNĐ ",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic)),
            SizedBox(
              width: width! * 0.08,
            ),
            Text( '${(oldprice)}' + "\VNĐ " ,
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
          ],
        )
      ],
    );
  }

}