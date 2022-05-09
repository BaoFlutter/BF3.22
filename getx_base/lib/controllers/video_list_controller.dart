import 'package:get/get.dart';

import '../models/video.dart';

class VideoListController extends GetxController{
  List<Video> videoList = [];

  updateVideoListOnGetXController({ required List<Video> videoList}){
    this.videoList = videoList;
    update();
  }


}