import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";
import "package:get/get.dart";
import "package:prescamai/controllers/theme_service_controller.dart";

class CenterImageText extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  const CenterImageText({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService =
        Get.put(MyThemeServiceController());

    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
                alignment: Alignment.center,
                child: Image(
                  height: 340,
                  image: AssetImage("assets/images/trophy-background.png"),
                )
                    .animate()
                    .shimmer(duration: Duration(seconds: 2))
                    .rotate(duration: Duration(seconds: 5))
                    .then()
                    .shimmer(duration: Duration(seconds: 2))
                    .rotate(duration: Duration(seconds: 5))
                    .then()
                    .shimmer(duration: Duration(seconds: 2))
                    .rotate(duration: Duration(seconds: 5))
                    .then()
                    .shimmer(duration: Duration(seconds: 2))
                    .rotate(duration: Duration(seconds: 5))),
            Container(
              alignment: Alignment.center,
              child: Image(
                height: 200,
                image: AssetImage(imagePath),
              )
                  .animate()
                  .shake(duration: Duration(milliseconds: 500))
                  .shimmer(duration: Duration(seconds: 1))
                  .then()
                  .shimmer(duration: Duration(seconds: 1))
                  .then()
                  .shimmer(duration: Duration(seconds: 1))
                  .then()
                  .shimmer(duration: Duration(seconds: 1))
                  .then()
                  .shimmer(duration: Duration(seconds: 1))
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontFamily: "Nunito",
            color: themeService.textColor,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: "Nunito",
              color: themeService.textColor,
            ),
          ),
        ),
      ],
    );
  }
}
