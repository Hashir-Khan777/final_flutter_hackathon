import 'package:flutter/material.dart';
import 'package:frontend/widgets/text_widget.dart';

Widget inputWidget({
  required String label,
  String? placeholder,
  IconData? icon,
  TextInputType? type,
  bool obscureText = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textWidget(text: label),
      Container(
        margin: const EdgeInsets.only(top: 5),
        child: TextFormField(
          keyboardType: type,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: placeholder,
            prefixIcon: Icon(icon),
            border: const OutlineInputBorder(
              gapPadding: 0,
            ),
          ),
        ),
      ),
    ],
  );
}
