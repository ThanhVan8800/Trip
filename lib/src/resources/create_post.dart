

// import 'dart:html';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
// import 'package:path/path.dart';
import 'package:sbtc_trip/constant.dart';
import 'package:sbtc_trip/src/models/api_response.dart';
import 'package:sbtc_trip/src/resources/login_page.dart';
import 'package:sbtc_trip/src/services/post_service.dart';
import 'package:sbtc_trip/src/services/user_services.dart';
class Post extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _PostState();

}
class _PostState extends State<Post>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _txtControlerBody = TextEditingController();
  bool _loading = false;
  File? _imageFile;
  final _picker = ImagePicker();
  Future getImage() async{
    // ignore: deprecated_member_use
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if(pickedFile != null)
    {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }
  void _createPost() async{
    String? image = _imageFile == null ? null : getStringImage(_imageFile);
    ApiResponse response = await createPost(_txtControlerBody.text, image);
    if(response.error == null){
      Navigator.of(context).pop();
    }else if(response.error == unauthorized){
      logout().then((value) => {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage()), (route)=>false)
      });
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${response.error}')
        ));
      setState(() {
        _loading =! _loading;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Tạo bài viết mới"),
      ),
      body: _loading ? Center(child: CircularProgressIndicator(),) : ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              image: _imageFile == null ? null : DecorationImage(
                    image: FileImage(_imageFile ?? File('')),
                    fit: BoxFit.cover
                )
            ),
            child: Center(
              child: IconButton(
                icon: Icon(Icons.image, size: 50,color: Colors.blueAccent,),
                onPressed: (){
                  getImage();
                },
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: 
              Padding(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  controller: _txtControlerBody,
                  keyboardType: TextInputType.multiline,
                  maxLines: 9,
                  validator: (val) => val!.isEmpty ? 'Bài viết không được bỏ trống' : null,
                  decoration: InputDecoration(
                    hintText: 'Hãy miêu tả cảm nghĩ của bạn...',
                    border: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.lightBlue ))

                  ),
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: kTextButton('Post', (){
                if(_formKey.currentState!.validate()){
                  setState(() {
                    _loading =! _loading;
                  });
                  _createPost();
                }
              }),
            )
        ],
      ),
    );
  }
}