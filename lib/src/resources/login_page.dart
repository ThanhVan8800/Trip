import 'package:flutter/material.dart';
import 'package:sbtc_trip/src/resources/screen_main.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key?key}): super(key: key);
  @override
  State<StatefulWidget> createState() => _LoginPageState();
  }
class _LoginPageState extends State<LoginPage>{
 
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset('assets/img/logo.png',height: 120,width: 155, fit: BoxFit.cover,);
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Đăng nhập'),
      ),
      body: Center(
       
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         
          children: [
              image,
              Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập tên'
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập số điện thoại'
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              
              child: OutlinedButton(
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => BottomNav())
                    );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all
                  (RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))
                ),
                child: Text('Đăng nhập'),
              ),
            )
          ],
        ),
      ),
    );
  }
}