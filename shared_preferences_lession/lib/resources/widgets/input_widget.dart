import 'package:flutter/material.dart';
class InputWidget extends StatelessWidget {
  final String lableText;
  final String hintText;
  final controler;
  const InputWidget({Key? key, required this.lableText,required this.hintText, required this.controler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 20, bottom: 5),
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: lableText,
              hintText: hintText
          ),
          controller: controler,
        )
    );
  }
}
