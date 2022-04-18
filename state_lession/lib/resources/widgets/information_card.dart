import 'package:flutter/material.dart';
class InformationCard extends StatelessWidget {
  final String lable1;
  final double averageMark;
  final String lable2;
  final String adjustment;
  const InformationCard({Key? key, required this.lable1,required this.averageMark,required this.lable2,required this.adjustment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Card(
        child: Container(
          padding: const EdgeInsets.only(right: 15, top: 20, bottom: 20, left: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                      child: Text(lable1),),

                  const SizedBox(width: 20,),
                  Expanded(
                    flex: 1,
                      child: Text(averageMark.toStringAsFixed(1)))
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                      child: Text(lable2)),

                  const SizedBox(width: 20,),
                  Expanded(
                    flex: 1,
                    child: Text(adjustment),
                  )
                ],
              )
            ],
          ),
        ),

      ),
    );
  }
}
