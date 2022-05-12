import 'package:api_lession/data_sources/api_services.dart';
import 'package:api_lession/models/video.dart';
import 'package:flutter/cupertino.dart';

class VideoListProvider extends ChangeNotifier{
  List<Video> videoList = [];

  getVideoList() async {
    this.videoList = await ApiServices().fetchVideoList();
    notifyListeners();
  }

}