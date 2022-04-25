import 'package:flutter/material.dart';
import 'package:state_lession/information_suite.dart';
import '../resources/strings.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {

  Future<List<Information>>? futureInformationList ;
  final db = InformationDatabase();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadInformationFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(INFORMATION),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<Information>>(
          future: futureInformationList,
          builder: (context, snapshot){
            if(snapshot.hasError) return Center(
              child: Text("Load Data Error"),
            );
            if(!snapshot.hasData) return Center(
              child: CircularProgressIndicator(),
            );
            List<Information> informationList = snapshot.data!;
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: informationList.length,
                itemBuilder: (BuildContext context, int index) {
                  Information information = informationList[index];
                  return Container(
                    height: 50,
                    child: Column(
                      children: [
                        Text(information.average_score.toString()),
                        Text(information.adjustment!)
                      ],
                    ),
                  );
                }
            );

          },
        ),
      ),
    );
  }

  loadInformationFromDatabase(){
    futureInformationList = db.fetchAll();
  }
}

