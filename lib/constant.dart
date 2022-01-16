
import 'package:flutter/material.dart';

// string
const baseURL = 'http://127.0.0.1:8000/api/';
const loginURL = baseURL + '/login';
const registerURL = baseURL + '/register';
const logoutURL = baseURL + '/logout';
const userURL = baseURL + '/user';
const postURL = baseURL + '/comments';

// errors
const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong, try again!';




// button

TextButton kTextButton(String label, Function onPressed){
  return TextButton(
    child: Text(label, style: const TextStyle(color: Colors.white),),
    style: ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue),
      padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.symmetric(vertical: 10))
    ),
    onPressed: () => onPressed(),
  );
}

//btn like and cmt
Expanded kLikeAndComment(int value, IconData icon, Color color, Function onTap){
  return Expanded(
          child: Material(
            child: InkWell(
              onTap: (){},
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: 16, color: color,),
                    SizedBox(width: 4,),
                    Text('$value')
                  ],
                ),
              )
            ),
          ),
  );
}