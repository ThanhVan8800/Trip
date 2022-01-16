import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sbtc_trip/src/resources/register.dart';
import 'package:sbtc_trip/src/resources/screen_main.dart';
import 'package:http/http.dart' as http;
import 'package:sbtc_trip/src/services/auth_services.dart';
// import 'package:sbtc_trip/src/resources/screen_main.dart';
import 'package:sbtc_trip/src/services/globals.dart';
import 'package:sbtc_trip/src/resources/register.dart';


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';
  loginPressed() async{
    if(_email.isNotEmpty && _password.isNotEmpty){
      http.Response response = await AuthServices.login(_email,_password);
      Map responseMap = jsonDecode(response.body);
      if(response.statusCode==200){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNav()));
            }
            else{
                errorSnackBar(context,responseMap.values.first);
            }}
            else{
              errorSnackBar(context,'enter all required fields ');
            }
    }

  
  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset(
      'assets/img/fb.png',
      height: 120,
      width: 155,
      fit: BoxFit.cover,
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Đăng nhập', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            Padding(
              padding: EdgeInsets.all(15),
              child: StreamBuilder(
                        //  stream:,
                        builder: (context, snapshot)=>
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                                
                                  labelText: "Nhập email",
                                  prefixIcon: Container(
                                      width: 50, child: Image.asset('assets/img/ic_user.png')),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffCED0D2), width: 1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)))),
                                          onChanged: (value){
                                            _email = value;
                                          },
                        ),
                      ),
            ),
            Padding(padding: EdgeInsets.all(15),
                  child:  StreamBuilder(
                        //  stream:,
                        builder: (context, snapshot)=>
                        TextField(
                          obscureText: true,// nhaap ẩn chu~
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                                
                                  labelText: "Mật khẩu",
                                  prefixIcon: Container(
                                      width: 50, child: Image.asset('assets/img/ic_phone.png')),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffCED0D2), width: 1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)))),
                                          onChanged: (value){
                                            _password = value;
                                          },
                        ),
                      ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginPressed()));
                },
                // style: ButtonStyle(
                //     shape: MaterialStateProperty.all(RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(20)))),
                child: Text('Đăng nhập', style: TextStyle(color: Colors.blue),),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                    padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(vertical: 10))
                  ),
                  
                ),
                
              ),
           // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Bạn chưa có mật khẩu? '),
                GestureDetector(
                  child: Text('Đăng ký', style: TextStyle(color: Colors.blue),),
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context)=>  Register(),
                      ),
                      );
                  },
                )
              ],
            ),
            
            // Padding(
            //     padding:EdgeInsets.all(15) ,//tạo khoảng cách nội dung với cái gì đó
            //     child:Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         TextButton(
            //           onPressed: (){
            //             // Navigator.push(context,
            //             //     MaterialPageRoute(builder: (context)=> const ForgetPassword(),
            //             //     ),
            //             // );
            //           },
            //           child:Text(
            //             'Quên mật khẩu?',
            //             style: TextStyle(
            //               color: Colors.blue,
            //               decoration: TextDecoration.underline
            //             ),
            //           ),
            //         ),
            //         TextButton(onPressed: (){
            //           Navigator.push(context,
            //           MaterialPageRoute(
            //             builder: (context)=>  Register(),
            //           ),
            //           );
            //         },
            //             child: Text('Đăng ký',
            //             style: TextStyle(color: Colors.blue,
            //             decoration: TextDecoration.underline),
            //             ),
            //         ),
            //       ],
            //     ), 
            //     ),
          ],
        ),
      ),
    );
  }
}
