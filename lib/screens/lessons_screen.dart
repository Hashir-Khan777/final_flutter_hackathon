import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constant.dart';
import 'package:frontend/controllers/category_controller.dart';
import 'package:frontend/screens/all_lessons.dart';
import 'package:frontend/screens/lesson_detail_screen.dart';
import 'package:frontend/widgets/course_category_widget.dart';
import 'package:frontend/widgets/text_widget.dart';
import 'package:get/get.dart';

class Lessons extends StatelessWidget {
  const Lessons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorConstants.primaryWhite),
      appBar: AppBar(
        backgroundColor: Color(ColorConstants.primaryWhite),
        foregroundColor: Color(ColorConstants.primaryBlue),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        title: textWidget(text: "Continue Your Lessons", fontSize: 17),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<CategoryController>(
          id: "category",
          init: CategoryController(),
          builder: (controller) {
            return ListView.builder(
              itemCount: controller.categories.length,
              itemBuilder: (contect, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: courseCategoryWidget(
                    context,
                    type: "Ongoing",
                    category: controller.categories[index]["categories"],
                    teacher: "Hashir Khan",
                    progress: 60,
                    colors: [
                      Color(ColorConstants.primaryWheat).withOpacity(0.6),
                      const Color(0xff008080).withOpacity(0.6),
                      Color(ColorConstants.primaryWheat).withOpacity(0.6),
                    ],
                    onPressed: () {
                      controller.getCategoryDetails(
                        controller.categories[index]["categories"],
                      );
                      Get.to(
                        AllLessons(
                          category: controller.categories[index]["categories"],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
