import 'package:flutter/material.dart';
import 'package:messenger_app/src/components/theme/constants.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color;
  final EdgeInsets padding;

  const PrimaryButton(
      {Key? key,
      required this.text,
      required this.press,
      this.color = xPrimaryColor,
      this.padding = const EdgeInsets.all(kDefaultPadding * 0.75)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: press,
    shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
      padding: padding,
      color: color,
      minWidth: double.infinity,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white
        ),
      ),
    );
  }
}
