import 'package:flutter/cupertino.dart';
import 'package:frontend/constants/color_constant.dart';
import 'package:frontend/widgets/button_widget.dart';
import 'package:frontend/widgets/text_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget courseCategoryWidget(
  context, {
  required String type,
  required String category,
  required String teacher,
  required int progress,
  List<Color>? colors,
  VoidCallback? onPressed,
}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      gradient: LinearGradient(
        tileMode: TileMode.mirror,
        begin: Alignment.topLeft,
        end: const Alignment(0.1, 2.3),
        colors: colors ??
            [
              Color(ColorConstants.primaryWheat).withOpacity(0.6),
              Color(ColorConstants.secondaryBlue),
              Color(ColorConstants.primaryWheat).withOpacity(0.6),
            ],
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
              text: type,
              color: ColorConstants.primaryWhite,
            ),
            textWidget(
              text: category,
              color: ColorConstants.primaryWhite,
            ),
            textWidget(
              text: "by $teacher",
              color: ColorConstants.primaryWhite,
            ),
            SizedBox(
              width: 100,
              child: buttonWidget(
                context,
                text: "Continue",
                fontSize: 14,
                height: 35,
                elevation: 0,
                backgroundColor: ColorConstants.navyBlue,
                borderRadius: 10,
                onPressed: onPressed ?? () {},
              ),
            )
          ],
        ),
        CircularPercentIndicator(
          radius: 60.0,
          lineWidth: 25.0,
          percent: progress / 100,
          center: textWidget(
            text: "$progress%",
            color: ColorConstants.primaryWhite,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          progressColor: Color(ColorConstants.primaryWhite),
          backgroundColor: Color(ColorConstants.primaryGrey).withOpacity(0.1),
        ),
      ],
    ),
  );
}
