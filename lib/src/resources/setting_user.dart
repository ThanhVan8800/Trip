


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbtc_trip/src/services/user_services.dart';
import 'login_page.dart';
class SettingUser extends StatefulWidget{
  const SettingUser({Key?key}): super(key: key);
  @override
  State<StatefulWidget> createState() => _SettingUser();

}
class _SettingUser extends State<SettingUser>{
  final CheckedPublic = CheckBoxModel(title: 'Công khai');
   final CheckedPrivate = CheckBoxModel(title: 'Chỉ mình tôi');
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
          appBar: AppBar(
        title: Text('Thay đổi'),  
        backgroundColor: Colors.yellow.shade700,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: (){
              logout().then((value) => {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false)
              });
            },
          )
        ],       
        ),
        body:Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text('Quyền riêng tư:\n'),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('Ai có thể xem bài viết của bạn?\n'),
                ),
                
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 2),
                  child: Text('Bảo mật:\n\n'),
                ),
                Text('. Đổi mật khẩu:'),
                
              ],
            ),
            TextField(
              cursorWidth:5,
              decoration: InputDecoration(
                
                labelText: 'Nhập mật khẩu mới'
              ),
            ),
            Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(400, 50, 30, 10),
                    ),
                  TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.blue,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                  child: const Text('Lưu'),
                ),
                  
                ],
            ),
            Row(
                children: [
                  
                  TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.blue,
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    logout().then((value) => {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false)
                  });
                  },
                  child: const Text('Đăng xuất'),
                ),
                  
                ],
            ),
           
             
            
          ],
        )
    
    
    );
    
  }
  
}
class CheckBoxModel{
  String title;
  bool value;
  CheckBoxModel({required this.title, this.value = false});
}