import 'package:api_lession/resources%20/strings.dart';
import 'package:api_lession/views/video_list_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MAIN_SCREEN),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: (){
                  var route = MaterialPageRoute(builder: (context)=> VideoListScreen());
                  Navigator.push(context, route);
                },
                child: Text(VIDEO_LOAD)),
          ],
        ),
      ),
    );
  }
}
