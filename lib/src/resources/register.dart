



import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:path/path.dart';
import 'package:sbtc_trip/src/resources/login_page.dart';
import 'package:sbtc_trip/src/resources/rounded_button.dart';
import 'package:http/http.dart' as http;
import 'package:sbtc_trip/src/resources/screen_main.dart';
import 'package:sbtc_trip/src/services/auth_services.dart';
import 'package:sbtc_trip/src/services/globals.dart';
class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Register();

}
class _Register extends State<Register>{
  String _name = '';
  String _email = '';
  String _password = '';
  
    createAccount() async{
          bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(_email);
          if(emailValid){
            http.Response response = 
                await AuthServices.register(_name, _email, _password);
            Map responseMap = jsonDecode(response.body);
            if(response.statusCode==200){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
            }
            else{
                errorSnackBar(context,responseMap.values.first[0]);
            }}
            else{
                errorSnackBar(context,'email not valid');
        }
      }
    
  @override
  Widget build(BuildContext context) {
   // Widget image = Image.asset('img/fb.png',height: 120,width: 155, fit: BoxFit.cover,);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Đăng ký',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
                onChanged: (value){
                  _name = value;
                },
              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                onChanged: (value){
                  _email = value;
                },
              ),
              SizedBox(height: 20,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                onChanged: (value){
                  _password = value;
                },
              ),
              SizedBox(height: 20,),
              RoundedButton(
                btnText: 'Create Account',
                   onBtnPressed: ()=> createAccount(),
              ),
              GestureDetector(
                child: Text('already have an account',
                  style: TextStyle(
                    decoration: TextDecoration.underline
                  ),
                ),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => const LoginPage())
                   );
                },
            ),
            ],
          ),
        ),
    );
  }
}
