





//get all post
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sbtc_trip/src/models/api_response.dart';
import 'package:sbtc_trip/src/models/post.dart';
// import 'package:sbtc_trip/src/resources/create_post.dart';
import 'package:sbtc_trip/src/services/user_services.dart';
import 'package:sbtc_trip/constant.dart';
Future<ApiResponse> getPosts() async{
  ApiResponse apiResponse = ApiResponse();
  try{
    String token = await getToken();
    final response = await http.get(Uri.parse(postURL),
      headers: {
        'Accept' : 'application/json',
        'Authorization' : 'Bearer $token'
      });
    switch(response.statusCode){
        case 200:
            apiResponse.data = jsonDecode(response.body)['posts'].map((p) => Post.fromJson(p));
            apiResponse.data as List<dynamic>;
            break;
        case 401:
            apiResponse.error = unauthorized;
            break;
        default:
            apiResponse.error = somethingWentWrong;
            break;
    }
  }
  catch(e){
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// create post
Future<ApiResponse> createPost(String body, String? image) async{
    ApiResponse apiResponse = ApiResponse();
    try{
      String token = await getToken();
      final response = await http.post(Uri.parse(postURL),
        headers: {
          'Accept' : 'application/json',
          'Authorization' : 'Bearer $token'
        }, body: image != null ? {
          'body' : body,
          'image' : image
        } : {'body' : body});
        switch (response.statusCode) {
          case 200:
            apiResponse.data = jsonDecode(response.body);
            break;
          case 422: 
            final errors = jsonDecode(response.body)['errors'];
            apiResponse.error = errors[errors.keys.elementAt(0)][0];
            break;
          case 401:
            apiResponse.error = unauthorized;
            break;
          default:
            apiResponse.error = somethingWentWrong;
            break;
        }
      // neu co hinh thi lay k hinh send body
    }catch(e){
        apiResponse.error = serverError;
    }
    return apiResponse;
}

// edit post
Future<ApiResponse> editPost(int postId, String body) async{
  ApiResponse apiResponse = ApiResponse();
  try{
    String token = await getToken();
    final response = await http.put(Uri.parse('$postURL/$postId'),
      headers: {
        'Accept' : 'application/json',
        'Authorization' : 'Bearer $token'
      },
      body: {
        'body' : body
      }
    );
    switch(response.statusCode){
      case 200: 
          apiResponse.data = jsonDecode(response.body)['message'];
          break;
      case 403:
          apiResponse.error = jsonDecode(response.body)['message'];
          break;
      case 401:
          apiResponse.error = unauthorized;
          break;
      default:
          apiResponse.error = somethingWentWrong;
          break;
    }
  }catch(e){
      apiResponse.error = serverError;
  }
  return apiResponse;
}
//delete post
Future<ApiResponse> deletePost(int postId ) async{
    ApiResponse apiResponse = ApiResponse();
    try{
        String token = await getToken();
        final response = await http.delete(Uri.parse('$postURL/$postId'),
            headers: {
              'Accept' : 'application/json',
              'Authorization' : 'Bearer $token'
            }
        );
        switch(response.statusCode){
            case 200:
                apiResponse.data = jsonDecode(response.body)['message'];
                break;
            case 403:
                apiResponse.error = jsonDecode(response.body)['message'];
                break;
            case 401:
                apiResponse.error = unauthorized;
                break;
            default:
                apiResponse.error = somethingWentWrong;
        }
    }catch(e){
        apiResponse.error = serverError;
    }
    return apiResponse;
}