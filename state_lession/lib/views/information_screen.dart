import 'package:flutter/material.dart';
import 'package:state_lession/resources/widgets/information_card.dart';

import '../resources/strings.dart';
class InformationScreen extends StatelessWidget {
  final double averageMark;
  final String adjustment;
  const InformationScreen({Key? key, required this.averageMark, required this.adjustment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(INFORMATION),
        centerTitle: true,
      ),
      body: Container(
        child: InformationCard(
            lable1: AVERAGE_SCORE,
            averageMark: averageMark,
            lable2: GRADE,
            adjustment: adjustment),
      ),
    );
  }
}
