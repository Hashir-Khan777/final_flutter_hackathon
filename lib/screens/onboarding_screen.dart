import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constant.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/widgets/button_widget.dart';
import 'package:frontend/widgets/text_widget.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .65,
            decoration: BoxDecoration(
              color: Color(ColorConstants.primaryBlue),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Image.asset(
                  "assets/image1.png",
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget(
                  text: "Perangkat Lunak Pengolah Gambar Vektor",
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: textWidget(
                    text:
                        "Jelajahi AiLearn untuk menambah kemampuanmu dalam mengoperasikan Adobe Illustrator",
                  ),
                ),
                buttonWidget(
                  context,
                  text: "MASUK",
                  onPressed: () => Get.to(const Login()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
