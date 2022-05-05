import 'package:flutter/material.dart';

import '../models/video.dart';

class VideoListProvider with ChangeNotifier {
  List<Video> videoList = [];

  updateVideoListOnProvider({ required List<Video> videoList}){
    this.videoList = videoList;
    notifyListeners();
  }

}