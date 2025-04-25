import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextDecoration? decoration;
  final Color? decorationColor;

  const AppText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.left,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 16.0,
    this.decoration,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: decoration,
        decorationColor: decorationColor ?? Colors.black,
      ),
    );
  }
}
