import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constant.dart';
import 'package:frontend/screens/dashboard_screen.dart';
import 'package:frontend/widgets/button_widget.dart';
import 'package:frontend/widgets/input_widget.dart';
import 'package:frontend/widgets/text_widget.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorConstants.primaryWhite),
      appBar: AppBar(
        backgroundColor: Color(ColorConstants.primaryWhite),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            color: Color(ColorConstants.primaryBlue),
            size: 30,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
              text: "Selamat Datang!",
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              child: textWidget(
                text:
                    "Masukan NISN dan password untuk memulai belajar sekarang",
                fontSize: 14,
              ),
            ),
            Column(
              children: [
                inputWidget(
                  label: "NISN",
                  placeholder: "Nomor NISN",
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 15),
                inputWidget(
                  label: "Password",
                  placeholder: "Masukkan Password",
                  icon: Icons.lock_outline,
                  type: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: MediaQuery.of(context).size.width,
                  child: textWidget(
                    text: "Lupa password",
                    textAlign: TextAlign.end,
                  ),
                ),
                buttonWidget(
                  context,
                  text: "MULAI BELAJAR",
                  marginTop: 25,
                  onPressed: () => Get.offAll(const Dashboard()),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
