import 'package:api_lession/controllers/video_list_obx_controller.dart';
import 'package:api_lession/models/video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/video_list_controller.dart';
import 'detail_video_screen.dart';
class SecondVideoListScreen extends StatelessWidget {
  const SecondVideoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final VideoListController videoListController = Get.find();
    //List<Video> videoList = videoListController.videoList;

    final VideoListObxControler videoListObxController = Get.find();
    final  videoList = videoListObxController.videoListObs.value;
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Video List"),
        centerTitle: true,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        //height: MediaQuery.of(context).size.height,
        //width: MediaQuery.of(context).size.width,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: videoList.length,
            itemBuilder: (BuildContext context, int index) {
              Video video = videoList[index];
              return GestureDetector(
                child: Card(
                  color: Colors.amber,
                  child: Container(
                    child: Column(
                      children: [
                        Image.network(video.url_photo!),
                        Text(video.title!)
                      ],
                    ),
                  ),
                ),
                onTap: (){
                  var route = MaterialPageRoute(builder: (context) => DetailVideoScreen(video: video));
                  Navigator.push(context, route);
                },
              );
            }
        ),
      ),
    );
  }
}
