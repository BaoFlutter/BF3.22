import 'package:api_lession/models/video.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/video_list_provider.dart';
import 'detail_video_screen.dart';
class SecondVideoListScreen extends StatelessWidget {
  const SecondVideoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //VideoListProvider videoListProvider = context.watch<VideoListProvider>();
    VideoListProvider videoListProvider = Provider.of<VideoListProvider>(context);
    List<Video> videoList = videoListProvider.videoList;

    return Scaffold(
      appBar: AppBar(
        title: Text("Second Video List"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
