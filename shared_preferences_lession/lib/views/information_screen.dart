import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_lession/resources/widgets/information_card.dart';

import '../resources/strings.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  Future<Map<String, dynamic>>? futureInformation;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInformationFormLocalStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(INFORMATION),
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: futureInformation,
        builder: (context, snapshot){
          if(snapshot.hasError ) return Center(
            child: Text("Load dữ liệu lỗi"),
          );
          if(!snapshot.hasData) return Center(
            child: CircularProgressIndicator(),
          );
          Map<String, dynamic> informationMap = snapshot.data!;
          return  Container(
            child: InformationCard(
                lable1: AVERAGE_SCORE,
                averageMark: informationMap['average_score'],
                lable2: GRADE,
                adjustment: informationMap['adjustment']),
          );


        },
      ),
      /*
      body: Container(
        child: InformationCard(
            lable1: AVERAGE_SCORE,
            averageMark: averageMark,
            lable2: GRADE,
            adjustment: adjustment),
      ),

       */
    );
  }

  getInformationFormLocalStorage(){
    futureInformation = _prefs.then((SharedPreferences prefs){
      double averageScore = prefs.getDouble("average_score")!;
      String adjustment = prefs.getString("adjustment")!;
      return {
        "average_score": averageScore,
        "adjustment" : adjustment
      };
    });

  }
}


