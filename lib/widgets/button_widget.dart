import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constant.dart';

Widget buttonWidget(
  context, {
  double marginTop = 15,
  double height = 50,
  double elevation = 8,
  double borderRadius = 20,
  required String text,
  double fontSize = 18,
  int? shadowColor,
  int? backgroundColor,
  VoidCallback? onPressed,
}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.only(top: marginTop),
    height: height,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        shadowColor: Color(shadowColor ?? ColorConstants.primaryBlue),
        backgroundColor: Color(backgroundColor ?? ColorConstants.primaryBlue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
      ),
      onPressed: onPressed ?? () {},
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    ),
  );
}
