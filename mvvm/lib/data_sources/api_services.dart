import 'package:api_lession/data_sources/api_urls.dart';
import 'package:api_lession/resources%20/utils/log.dart';
import '../models/video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../resources /strings.dart';

class ApiServices {
  Future<List<Video>> fetchVideoList() async {
   List<Video> videoList = [];
   var videoListUri = ApiUrl.VIDEO_URL;
   var response;
   try{
     response = await http.get(videoListUri);
   }
   catch(e){
     print(ERROR_LOAD + e.toString());
   }
   var jsonBody = convert.jsonDecode(response.body);
   Log().printJson(json: jsonBody);
   if(jsonBody['code'] == 'success'){
     List jsonList = jsonBody['list'];
     for (var jsonVideo in jsonList){
       Video video = Video.fromJson(jsonVideo);
       videoList.add(video);
     }
   }
   return videoList;
  }


}