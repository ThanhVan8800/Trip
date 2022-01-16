



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbtc_trip/constant.dart';
import 'package:sbtc_trip/src/models/api_response.dart';
import 'package:sbtc_trip/src/models/post.dart';
import 'package:sbtc_trip/src/resources/login_page.dart';
// import 'package:sbtc_trip/src/resources/personal_page.dart';
import 'package:sbtc_trip/src/services/post_service.dart';
import 'package:sbtc_trip/src/services/user_services.dart';
//BAI VIET
class EvaluateTab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _EvaluateTab();

}
class _EvaluateTab extends State<EvaluateTab>{
  List<dynamic> _postList = [];
  int userId = 0;
  bool _loading = true;

  // Lấy tất cả bài viết
  Future<void> retrievePosts() async{
    userId = await getUserId();
    ApiResponse response = await getPosts();
    if(response.error == null){
      setState(() {
        _postList = response.data as List<dynamic>;
        _loading = _loading ?! _loading : _loading;
      });
    }else if(response.error == unauthorized){
      logout().then((value) => {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false)
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${response.error}'),
      ));
    }
  }
  @override
  void initState(){
    retrievePosts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      return _loading ? Center(child: CircularProgressIndicator()) :
      ListView.builder(
        itemCount: _postList.length,
        itemBuilder: (BuildContext context, int index){
            Post post = _postList[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                          children: [
                            Container(
                              width: 38, height: 38, 
                              decoration: BoxDecoration(
                                image: post.user!.image != null ?
                                    DecorationImage(image: NetworkImage('${post.user!.image}')) : null,
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.amber,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text(
                                '${post.user!.name}',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                          ],
                        ),
                        ),
                        post.user!.id == userId ? 
                        PopupMenuButton(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.more_vert, color: Colors.black,),
                            ),
                             itemBuilder: (context) => 
                             [
                               PopupMenuItem(child: Text('Edit'), value: 'edit',),
                               PopupMenuItem(child: Text('Delete'), value: 'delete',),
                             ],
                             onSelected: (val){
                               if(val == 'edit'){
                                 //edit

                               }else{
                                  //edit

                               }
                             },
                          
                          ) : SizedBox()
                    ],
                  ),
                  SizedBox(height: 12,),
                  Text('${post.body}'),
                  post.image != null ? 
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      margin: EdgeInsets.only(top:5),
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage('${post.image}'),
                          fit: BoxFit.cover
                        )
                      ),
                  ) : 
                  
                  SizedBox(height: post.image != null ? 0 : 10,),
                  Row(
                    children: [
                      kLikeAndComment(
                        post.likesCount ?? 0,
                        post.selfLiked == true ? Icons.favorite : Icons.favorite_outline,
                        post.selfLiked == true ? Colors.red : Colors.blue,
                        (){

                        }
                      ),
                       Container(
                      height: 25,
                      width: 0.5,
                      color: Colors.black38,
                    ),
                    kLikeAndComment(
                        post.commentsCount ?? 0 ,
                        Icons.sms_outlined,
                        Colors.black26,
                        (){

                        }
                      ),
                      Container(
                      height: 25,
                      width: 0.5,
                      color: Colors.black38,
                    ),
                    ],
                  )
                ],
              ),
            );// noi_dung no body
        }
        );
  }

}