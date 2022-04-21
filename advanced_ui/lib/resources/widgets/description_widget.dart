import 'package:flutter/material.dart';
class DescriptionWidget extends StatelessWidget {
  final String text;
  const DescriptionWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(top : 30 , right: 30, left: 30),
      child: Text(text, softWrap: true,),

    );
  }
}
