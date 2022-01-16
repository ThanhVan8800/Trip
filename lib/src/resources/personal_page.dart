
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbtc_trip/src/resources/screen_main.dart';
import 'package:sbtc_trip/src/resources/posts_tab.dart';
import 'package:sbtc_trip/src/resources/setting_user.dart';
import 'package:sbtc_trip/src/resources/information_tab.dart';

import 'create_post.dart';

class PersonalPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PersonalPage();
  }

}
class _PersonalPage extends State<PersonalPage> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }
  void _handleTabSelection(){
    setState(() {
      
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Trang cá nhân',
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Post()));
              },
              child: Icon(Icons.add),
            ),
              appBar: AppBar(
                backgroundColor: Colors.yellow.shade300,
                title: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:[
                                // Text(
                                // 'Trang cá nhân', 
                                // style: TextStyle(
                                //   fontFamily: 'Klavika',
                                //   color: Colors.blue,
                                //   fontWeight: FontWeight.bold
                                //     ),
                                //   ),
                              ]
                            )
                          ]
                        ),
                        Row(
                            children: [
                              Text('ThanhVan',
                               style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),
                               )
                              
                            ],
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:[
                            TextButton(
                              onPressed: (){
                                  Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => SettingUser()),
                                     );
                              }, 
                              child: Text('Thay đổi',
                                style: TextStyle(color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              
                              
                              )
                              
                             
                          ]
                          ) ,
                          
                          
                       ],
                ),
               
                
                bottom: TabBar(
                  indicatorColor: Color(0xF20d8bf0),
                 unselectedLabelColor: Colors.grey,
                 controller: _tabController,
                 tabs: [
                     Tab(
                       child: Text('Bài đánh giá', 
                          style: TextStyle(color:_tabController.index == 0 ? Color(0xF20d8bf0) : Colors.grey,)
                        ),
                       
                     ),
                     Tab(
                       child: Text('Bộ sưu tập',
                       style: TextStyle(color:_tabController.index == 1 ? Color(0xF20d8bf0) : Colors.grey,)
                       ),
                     ),
                     Tab(
                       child: Text('Thông tin cá nhân',
                       style: TextStyle(color:_tabController.index == 2 ? Color(0xF20d8bf0) : Colors.grey,)
                       ),
                     )
                     
                 ],
                ),
              ),
              body: Center(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Chưa có bài viết đánh giá nào')
                        ],
                      ),
                    ),
                    EvaluateTab(),
                    InformationTab()
                  ],
                ),
              ),
          ),
        ),
    );
  }

}