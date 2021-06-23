import 'package:flutter/material.dart';
import 'package:messenger_app/src/components/theme/constants.dart';

class FillOutLineButton extends StatelessWidget {
  final bool isFilled;
  final VoidCallback press;
  final String text;

  const FillOutLineButton({Key? key, this.isFilled =true,required this.press,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: press,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      side: BorderSide(color: Colors.white),
    ),
      color: isFilled ? Colors.white: Colors.transparent,
      child: Text(
        text,
        style: TextStyle(
          color: isFilled ? xContentColorLightTheme : Colors.white,
          fontSize: 12
        ),
      ),
    );
  }
}
