import 'package:flutter/material.dart';
import 'package:frontend/constants/color_constant.dart';
import 'package:frontend/controllers/category_controller.dart';
import 'package:frontend/widgets/text_widget.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class LessonDetails extends StatefulWidget {
  const LessonDetails({super.key});

  @override
  State<LessonDetails> createState() => _LessonDetailsState();
}

class _LessonDetailsState extends State<LessonDetails> {
  late VideoPlayerController videoController;
  bool showControll = true;

  // @override
  // void initState() {
  //   super.initState();
  //   videoController = VideoPlayerController.network(
  //       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
  //     ..initialize().then(
  //       (_) {
  //         setState(() {});
  //       },
  //     );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorConstants.primaryWhite),
      appBar: AppBar(
        backgroundColor: Color(ColorConstants.primaryWhite),
        foregroundColor: Color(ColorConstants.primaryBlue),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_basket_outlined),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<CategoryController>(
          id: "category",
          init: CategoryController(),
          builder: (controller) {
            if (controller.category != null) {
              videoController = VideoPlayerController.network(
                controller.category?[0]["video"],
              )..initialize().then(
                  (_) {
                    setState(() {});
                  },
                );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                videoController.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: videoController.value.aspectRatio,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showControll = true;
                                  });
                                },
                                child: VideoPlayer(videoController),
                              ),
                              showControll
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          videoController.value.isPlaying
                                              ? videoController.pause()
                                              : videoController.play();
                                        });
                                        setState(() {
                                          showControll =
                                              !videoController.value.isPlaying;
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor:
                                            Color(ColorConstants.secondaryBlue),
                                        child: Icon(
                                          videoController.value.isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                          color: Color(
                                              ColorConstants.primaryWhite),
                                        ),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      )
                    : Container(),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: textWidget(
                    text: "Basic UI?UX Designer",
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    textWidget(
                      text: "4.8",
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(width: 2),
                    Row(
                      children: const [
                        Icon(Icons.star_border, size: 16),
                        Icon(Icons.star_border, size: 16),
                        Icon(Icons.star_border, size: 16),
                        Icon(Icons.star_border, size: 16),
                        Icon(Icons.star_border, size: 16),
                      ],
                    ),
                    const SizedBox(width: 2),
                    textWidget(
                      text: "(534)",
                      color: ColorConstants.primaryGrey,
                      fontSize: 13,
                    ),
                    const SizedBox(width: 30),
                    textWidget(
                      text: "ui/ux",
                      color: ColorConstants.secondaryBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    textWidget(text: "Created By"),
                    const SizedBox(width: 3),
                    textWidget(
                      text: "Azamat Baimatov",
                      color: ColorConstants.secondaryBlue,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
