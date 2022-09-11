import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constant.dart';
import 'package:frontend/controllers/category_controller.dart';
import 'package:frontend/screens/lesson_detail_screen.dart';
import 'package:frontend/widgets/text_widget.dart';
import 'package:get/get.dart';

class AllLessons extends StatelessWidget {
  const AllLessons({super.key, this.category});

  final String? category;

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
        title: textWidget(text: category ?? "", fontSize: 17),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: GetBuilder<CategoryController>(
          id: "categoryDetails",
          init: CategoryController(),
          builder: (controller) {
            return ListView.builder(
              itemCount: controller.categoryDetails.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.getSpeceficCategory(
                      category ?? "",
                      controller.categoryDetails[index]["id"],
                    );
                    Get.to(const LessonDetails());
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Material(
                      elevation: 5,
                      shadowColor:
                          Color(ColorConstants.primaryBlue).withOpacity(0.3),
                      child: ListTile(
                        tileColor: Color(ColorConstants.primaryWhite),
                        leading: Icon(
                          Icons.play_arrow_rounded,
                          size: 50,
                          color: Color(ColorConstants.navyBlue),
                        ),
                        title: textWidget(
                          text: controller.categoryDetails[index]["title"],
                        ),
                        subtitle: textWidget(
                          text: controller.categoryDetails[index]["created_by"],
                        ),
                      ),
                    ),
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
