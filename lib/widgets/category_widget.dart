import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constant.dart';
import 'package:frontend/widgets/text_widget.dart';

Widget categoryWidget({
  required String label,
  required String image,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 40,
        height: 40,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(height: 10),
      textWidget(text: label, color: ColorConstants.primaryGrey, fontSize: 12),
    ],
  );
}
