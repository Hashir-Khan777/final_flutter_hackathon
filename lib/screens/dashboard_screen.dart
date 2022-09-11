import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constant.dart';
import 'package:frontend/screens/lessons_screen.dart';
import 'package:frontend/widgets/button_widget.dart';
import 'package:frontend/widgets/category_widget.dart';
import 'package:frontend/widgets/course_category_widget.dart';
import 'package:frontend/widgets/text_widget.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorConstants.primaryWhite),
      appBar: AppBar(
        backgroundColor: Color(ColorConstants.primaryWhite),
        foregroundColor: Color(ColorConstants.primaryBlue),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget(
              text: "Hi Hafiz 👋",
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                textWidget(text: "Let's Find Your ", fontSize: 13),
                textWidget(
                  text: "Course!",
                  color: ColorConstants.secondaryBlue,
                  fontSize: 13,
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_basket_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Color(ColorConstants.secondaryWhite).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Search your course...",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.filter_list_outlined),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  categoryWidget(label: "Coding", image: "assets/image2.png"),
                  categoryWidget(label: "Design", image: "assets/image2.png"),
                  categoryWidget(
                      label: "Marketing", image: "assets/image2.png"),
                  categoryWidget(label: "Business", image: "assets/image2.png"),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  categoryWidget(
                      label: "Lifestyle", image: "assets/image2.png"),
                  categoryWidget(label: "Music", image: "assets/image2.png"),
                  categoryWidget(
                      label: "Academics", image: "assets/image2.png"),
                  categoryWidget(label: "More", image: "assets/image2.png"),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textWidget(
                      text: "Continue Your Lessons",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    GestureDetector(
                      onTap: () => Get.to(const Lessons()),
                      child: textWidget(
                        text: "See all",
                        color: ColorConstants.secondaryBlue,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              CarouselSlider(
                items: [
                  courseCategoryWidget(
                    context,
                    type: "Ongoing",
                    category: "Basic UI?UX Designer",
                    progress: 75,
                    teacher: "Azamat baimatov",
                  ),
                ],
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textWidget(
                      text: "Recommendation Course",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textWidget(
                      text: "See all",
                      color: ColorConstants.secondaryBlue,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
