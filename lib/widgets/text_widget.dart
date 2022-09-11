import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constant.dart';

Widget textWidget({
  required String text,
  int? color,
  double fontSize = 14,
  double lineHeight = 1.3,
  FontWeight? fontWeight = FontWeight.normal,
  TextAlign textAlign = TextAlign.left,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: Color(color ?? ColorConstants.primaryBlue),
      fontSize: fontSize,
      height: lineHeight,
      fontWeight: fontWeight,
    ),
  );
}
