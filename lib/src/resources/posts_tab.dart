



// bài đánh giá
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbtc_trip/src/resources/personal_page.dart';

class EvaluateTab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _EvaluateTab();

}
class _EvaluateTab extends State<EvaluateTab>{

  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset('img/vungtau.png',height: 220,width: 500 , fit: BoxFit.cover,);
    return Container(
      child: ListView(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(10, 15, 10, 10),
                    child: Text('TV', 
                    style: TextStyle(
                      color: Colors.blueAccent
                        ),
                      ),
                  ),
                  title: Text('ThanhVan'),

                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Mang tiền về cho mẹ \n''Mang tiền về cho mẹ', softWrap: true,
                          style: TextStyle(
                            fontFamily: 'Times New Roman', 
                            fontWeight: FontWeight.w100, fontSize: 15
                            ),
                      ),
                    
                  ),
                ),
                // Image.asset('assets/img/vungtau.png'),
                image,
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(10, 15, 10, 10),
                    child: Text('TV', 
                    style: TextStyle(
                      color: Colors.blueAccent
                        ),
                      ),
                  ),
                  title: Text('ThanhVan'),

                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Con đốt điếu cần, để cúng cho di lạc \n''Cám ơn người đã ban, quần áo con đang mặc', softWrap: true,
                          style: TextStyle(
                            fontFamily: 'Times New Roman', 
                            fontWeight: FontWeight.w100, fontSize: 15
                            ),
                      ),
                    
                  ),
                ),
                Image.asset('assets/img/Kerman.png'),
              ],
            ),
          )
        ],
      ),
    );
  }

}