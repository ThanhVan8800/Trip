


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditInfo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _EditInfo();

}
class _EditInfo extends State<EditInfo>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade700,
          title: 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      'Dữ liệu cá nhân', 
                      style: TextStyle(
                        fontFamily: 'Klavika',
                        color: Colors.black
                          ),
                        ),
                    
                ],
              ),
              
            ],
            ),
            
          ),
          body: Column(
            children: [
              Row(
                
                  children: [
                    Padding(padding: EdgeInsets.all(10),
                      child:Text('Họ tên   ''Nguyễn Văn Thành'),
                    )

                  ],
              ),
              Row(
                  children: [
                    Padding(padding: EdgeInsets.all(10),
                      child:Text('Nơi ở   ''HongKong bên hong chợ lớn'),
                    )

                  ],
              ),
              Row(
                  children: [
                    Padding(padding: EdgeInsets.all(10),
                      child:Text('Sở thích    ''Cưỡi ngựa xem hoa'),
                    )

                  ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                      child: TextButton(onPressed: (){}, 
                      child: Text('Chỉnh sửa')),

                    )
                ],
              )
            ],
          )
        
        
        
    );
  }

}