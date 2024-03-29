import 'package:api_lession/models/video.dart';
import 'package:api_lession/views/video_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
class DetailVideoScreen extends StatelessWidget {
  final Video video;
  const DetailVideoScreen({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(video.title!),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: (){
            //Navigator.pop(context);
            Get.back();
            //var route = MaterialPageRoute(builder: (context)=> VideoListScreen() );
            //Navigator.push(context, route);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Image.network(video.url_photo!),
            Html(
                data: video.description!)
          ],
        ),
      ),

    );
  }
}
