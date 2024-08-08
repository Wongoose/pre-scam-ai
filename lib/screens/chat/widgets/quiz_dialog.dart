import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:prescamai/shared/my_text_widgets.dart";
import "package:prescamai/shared/my_theme_divider.dart";

class QuizDialog extends StatelessWidget {
  final String title;
  final String body;
  final String correctAnswer;
  final VoidCallback onCorrectAnswer;

  const QuizDialog({
    super.key,
    required this.title,
    required this.body,
    required this.correctAnswer,
    required this.onCorrectAnswer,
  });

  void _handleAnswer(BuildContext context, String answer) {
    if (answer == correctAnswer) {
      onCorrectAnswer();
    } else {
      Get.showSnackbar(GetSnackBar(
        title: "Incorrect answer",
        message: "Please try again.",
        duration: Duration(seconds: 1),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        clipBehavior: Clip.antiAlias,
        insetPadding: EdgeInsets.symmetric(horizontal: 60),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 30),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: MyTextBolded(title,
                  fontSize: 24, textAlign: TextAlign.center)),
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: MyText(body, textAlign: TextAlign.center)),
          SizedBox(height: 20),
          ThemedDivider(height: 0),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(0),
                    // width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: Colors.transparent,
                    child: TextButton(
                        onPressed: () => _handleAnswer(context, "yes"),
                        child: MyTextBolded("Yes",
                            color: Theme.of(context).colorScheme.secondary)),
                  ),
                ),
                ThemedVerticalDivider(thickness: 0, endIndent: 0, indent: 0),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(0),
                    // width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: Colors.transparent,
                    child: TextButton(
                        onPressed: () => _handleAnswer(context, "no"),
                        child: MyTextBolded("No", color: Colors.red[400])),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
