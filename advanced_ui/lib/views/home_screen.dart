import 'package:advanced_ui/resources/strings.dart';
import 'package:advanced_ui/resources/widgets/cover_image_widget.dart';
import 'package:advanced_ui/resources/widgets/description_widget.dart';
import 'package:advanced_ui/resources/widgets/icon_text_button.dart';
import 'package:advanced_ui/resources/widgets/title_widget.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // image
           CoverImageWidget(imageUrl: "assets/images/lake.jpeg"),
            //  title
           TitleWidget(
               title: "Oeschinen Lake Campground",
               subTtile: "Kandersteg, Switzerland",
               rate: 41),
            // buttons
            Container(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                      child: IconTextButton(
                          onPressed: (){
                            print("Calling");
                          },
                          iconData: Icons.call,
                          color: Colors.blue,
                          textButton: CALL)),
                  Expanded(
                      flex: 1,
                      child: IconTextButton(
                          onPressed: (){
                            print("Routing...");
                          },
                          iconData: Icons.navigation,
                          color: Colors.blue,
                          textButton: ROUTE)),
                  Expanded(
                      flex: 1,
                      child: IconTextButton(
                          onPressed: (){
                            print("Sharing....");
                          },
                          iconData: Icons.share,
                          color: Colors.blue,
                          textButton: SHARE)),
                ],
              ),
            ),
            DescriptionWidget(
                text: "Oeschinen Lake or Oeschinensee as the Swiss call it, is one of the best lakes in Switzerland, if not on the earth. Oeschinen Lake lies in the Kandertal valley in Bernese Oberland region of Switzerland. If you love swimming, rowing, fishing and a barbeque by the lake, or just the breathtaking Alpine views, then this place must be on top of your Switzerland Bucketlist. Moreover, The mountains and valleys around here are an open invitation to serious hikers!")

            // description
          ],
        ),
      ),
    );
  }
}
