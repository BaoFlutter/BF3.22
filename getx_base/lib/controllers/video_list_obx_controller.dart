import 'package:get/get.dart';

import '../models/video.dart';

class VideoListObxControler extends GetxController{
  // Obx = Obsever + RxDart
  // Kiểu dữ liệu: Obx và thuần ( int, string ... }
  // thuần => Obs : int a = 10 ; var a_obs = a.obs ;
  // obs => thuần : var b_obs = 5.obs; int b = b_obs.value;
  var videoListObs = [].obs;

  updateVideoListObxController({ required List<Video> videoList}){
    this.videoListObs = videoList.obs ;
    update();
  }


}