import 'package:api_lession/data_sources/api_services.dart';
import 'package:api_lession/providers/video_list_provider.dart';
import 'package:api_lession/views/detail_video_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/video.dart';
import '../resources /strings.dart';
class VideoListScreen extends StatefulWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  Future<List<Video>>? futureVideoList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadVideos();
  }

  @override
  Widget build(BuildContext context) {
    //VideoListProvider videoListProvider = context.read<VideoListProvider>();
    VideoListProvider videoListProvider = Provider.of<VideoListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(VIDEO_LIST),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<Video>>(
          future: futureVideoList,
          builder: (context, snapshot){
            if(snapshot.hasError) return Center(
              child: Text(ERROR_LOAD),
            );
            if(!snapshot.hasData) return Center(
              child: CircularProgressIndicator(),
            );
            List<Video> videoList = snapshot.data! ;
            videoListProvider.updateVideoListOnProvider(videoList: videoList);

            return GridView.builder(
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
            );

          },
        ),
      ),
    );
  }

  loadVideos(){
    futureVideoList = ApiServices().fetchVideoList();

  }


}
