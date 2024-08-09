import "package:animated_flip_counter/animated_flip_counter.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";
import "package:get/get.dart";
import "package:prescamai/controllers/quiz_controller.dart";
import "package:prescamai/screens/chat/widgets/center_trophy.dart";
import "package:prescamai/utilities/navigation.dart";

class ChatComplete extends StatefulWidget {
  final String description;
  final String? completedMessage;
  final VoidCallback? initFunction;
  final VoidCallback? completeFunction;

  const ChatComplete(
      {required this.description,
      this.initFunction,
      this.completeFunction = navigateOffAllHome,
      this.completedMessage});

  @override
  State<ChatComplete> createState() => _ChatCompleteState();
}

class _ChatCompleteState extends State<ChatComplete> {
  @override
  void initState() {
    super.initState();
    if (widget.initFunction != null) widget.initFunction!();
  }

  @override
  Widget build(BuildContext context) {
    final QuizController quizController = Get.put(QuizController());
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(35, 32, 35, 22),
            child: Column(
              children: [
                Expanded(flex: 2, child: Container()),
                CenterTrophy(
                  title: "Congratulations!",
                  description: widget.description,
                ),
                Expanded(child: Container()),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(CupertinoIcons.star,
                        color: Theme.of(context).colorScheme.secondary),
                    SizedBox(height: 2),
                    Text(
                      "POINTS EARNED",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    SizedBox(height: 2),
                    Obx(() {
                      return AnimatedFlipCounter(
                        value: quizController.points.value,
                        prefix: "+",
                        wholeDigits: 3,
                        duration: Duration(seconds: 3),
                        textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      );
                    }),
                  ],
                )
                    .animate(delay: Duration(seconds: 1))
                    .flipH()
                    .shimmer(duration: Duration(seconds: 3))
                    .then()
                    .shimmer(duration: Duration(seconds: 3))
                    .then()
                    .shimmer(duration: Duration(seconds: 3)),
                Expanded(child: Container()),
                // SizedBox(height: 15),
                GestureDetector(
                  onTap: () => widget.completeFunction!(),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      widget.completedMessage ?? "Click here to go back home",
                      style: TextStyle(
                          fontFamily: "Nunito",
                          decoration: TextDecoration.underline,
                          decorationColor:
                              Theme.of(context).colorScheme.secondary,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
