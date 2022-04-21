import 'package:flutter/material.dart';
class IconTextButton extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final onPressed;
  final String textButton;
  const IconTextButton({Key? key,
    required this.onPressed,
    required this.iconData,
    required this.color,
    required this.textButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Column(
          children: [
            Icon(iconData, color: color,),
            const SizedBox(height: 5,),
            Text(textButton.toUpperCase(), style: TextStyle(color: color, fontWeight: FontWeight.bold),),
          ],
        ),
      ),

    );
  }
}
