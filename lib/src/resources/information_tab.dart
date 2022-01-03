


// Thông tin cá nhân
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbtc_trip/src/resources/edit_info.dart';

class InformationTab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _InformationTab();

}
class _InformationTab extends State<InformationTab>{
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        body: Container(
          child: ListView(
            children: [
              Column(
                children: [
                  Align(
                        child: ListTile(
                      
                  ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: ListTile(
                        leading: Icon(Icons.house_rounded),
                        title: Text('Nơi ở'),
                        
                      ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                      child: ListTile(
                        leading: Icon(Icons.email_rounded),
                        title: Text('Email'),
                        
                      ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                      child: ListTile(
                        leading: Icon(Icons.favorite_border_rounded),
                        title: Text('Sở thích'),
                        
                      ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                      child: ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('Sđt'),
                        
                      ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        
                        child: TextButton(
                          
                          onPressed: (){
                            Navigator.push((context),
                            MaterialPageRoute(builder: 
                            (context)=> EditInfo()));
                          },
                           child:Text('Chỉnh sửa thông tin',
                            style: TextStyle(fontSize: 15, 
                            fontWeight: FontWeight.bold, 
                            fontStyle: FontStyle.italic,)
                           ),
                           ),
                        )
                    ],
                  )
                ],
              )
            ],

          ),
        ),
        
    );
  }

}