import 'dart:convert';
import 'package:sbtc_trip/src/services/Loadpost_Object.dart';
import 'package:http/http.dart' as http;

class LoadPostProvider {
  static Future<List<dynamic>> readJsonData() async {
    var url = "http://192.168.1.5/Connect_DB/LoadPost_api.php";
    var response = await http
        .post(Uri.parse(url), headers: {"Accept": "applicayion/json"});
    var data = json.decode(response.body);
    return data['LoadPost'];
  }

  static Future<List<LoadPostObject>> getAllLoadPost() async {
    List<LoadPostObject> lsResult = [];
    List<dynamic> data = await readJsonData();
    lsResult = data.map((e) => LoadPostObject.fromJson(e)).toList();
    return lsResult;
  }
}
