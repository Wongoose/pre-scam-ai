import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";
import "package:prescamai/controllers/chat_ai_controller.dart";

class StartQuizFAB extends StatelessWidget {
  final VoidCallback? onPressedFunc;
  final QuizPrompt quizPrompt;
  final int messageCount;

  const StartQuizFAB(
      {super.key,
      this.onPressedFunc,
      required this.quizPrompt,
      required this.messageCount});

  @override
  Widget build(BuildContext context) {
    return quizPrompt == QuizPrompt.waiting
        ? Container(
            margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: FloatingActionButton.extended(
              elevation: 0,
              extendedPadding: EdgeInsets.fromLTRB(25, 10, 25, 10),
              onPressed: null,
              backgroundColor: Colors.black.withOpacity(0.7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              label: Text(
                  "$messageCount more message${messageCount > 1 ? 's' : ''} to start quiz"),
              icon: Icon(
                CupertinoIcons.chat_bubble_2,
                color: Colors.white,
                size: 30,
              ),
            ),
          )
        : Container(
            margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: FloatingActionButton.extended(
              extendedPadding: EdgeInsets.fromLTRB(25, 10, 25, 10),
              onPressed: onPressedFunc,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35), // Circular shape
              ),
              label: Text("Start Quiz"),
              icon: Icon(
                CupertinoIcons.chat_bubble_2,
                color: Colors.white,
                size: 30,
              ),
            ),
          ).animate().shake();
  }
}
