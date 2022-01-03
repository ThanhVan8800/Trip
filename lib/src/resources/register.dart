



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Register();

}
class _Register extends State<Register>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
              children:<Widget> [
                  SizedBox(
                    height: 140,
                  ),
                  Image.asset('assets/img/fb.png'),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 6),
                    child: Text('Chào mừng bạn đến với Trip!',
                     style: TextStyle(fontSize: 22, color: Color(0xff333333)),
                    ),
                  ),
                  Text(
                     "Thực hiện các bước đăng ký đơn giản",
                     style: TextStyle(fontSize: 16, color: Color(0xff606470)),
                  ),
                  Padding(
                   padding: const EdgeInsets.fromLTRB(0, 80, 0, 20),

                      child: StreamBuilder(
                        //  stream:,
                        builder: (context, snapshot)=>
                        TextField(
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                                
                                  labelText: "Name",
                                  prefixIcon: Container(
                                      width: 50, child: Image.asset('assets/img/ic_user.png')),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffCED0D2), width: 1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)))),
                        ),
                      ),
                      
                    ),
                        StreamBuilder(
                        //  stream:,
                        builder: (context, snapshot)=>
                        TextField(
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                                
                                  labelText: "Phone Number",
                                  prefixIcon: Container(
                                      width: 50, child: Image.asset('assets/img/ic_phone.png')),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffCED0D2), width: 1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)))),
                        ),
                      ),
                      Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: StreamBuilder(
                    builder: (context, snapshot) => TextField(
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                              labelText: "Email",
                              prefixIcon: Container(
                                  width: 50, child: Image.asset("assets/img/ic_mail.png")),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffCED0D2), width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)))),
                        )),
              ),
              StreamBuilder(
                  builder: (context, snapshot) => TextField(
                        obscureText: true,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Container(
                                width: 50, child: Image.asset("assets/img/ic_phone.png")),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffCED0D2), width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)))),
                      )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: OutlinedButton(
                    
                    onPressed: (){},
                    child: Text(
                      "Signup",
                      style: TextStyle(color: Colors.yellowAccent, fontSize: 18),
                    ),
                    
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: RichText(
                  text: TextSpan(
                      text: "Already a User? ",
                      style: TextStyle(color: Color(0xff606470), fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Login now",
                            style: TextStyle(
                                color: Color(0xff3277D8), fontSize: 16))
                      ]),
                ),
              )
              ],
          ),
        ),
        ),
    );
  }

}