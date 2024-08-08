import "package:get/get.dart";
import "package:prescamai/models/quiz_model.dart";
import "package:prescamai/models/scam_model.dart";
import "package:prescamai/screens/chat/pages/chat_complete.dart";
import "package:prescamai/screens/chat/widgets/quiz_dialog.dart";

class QuizController extends GetxController {
  late Scam scam;
  RxInt currentQuizIndex = 0.obs;
  RxInt points = 0.obs;

  void initialize(Scam scam) {
    this.scam = scam;
    _showNextQuizDialog();
  }

  void _showNextQuizDialog() async {
    if (currentQuizIndex.value < scam.quiz.length) {
      QuizItem quiz = scam.quiz[currentQuizIndex.value];
      Get.dialog(
        QuizDialog(
          title: "Question ${currentQuizIndex.value + 1}",
          body: quiz.question,
          correctAnswer: quiz.answer,
          onCorrectAnswer: () {
            currentQuizIndex.value++;
            Get.back();
            _showNextQuizDialog();
          },
        ),
        barrierDismissible: false,
      );
    } else {
      // All quizzes are done, handle completion
      Get.to(
          () => ChatComplete(
              description:
                  "You have completed and obtained the ${scam.title} Award!"),
          transition: Transition.zoom);
      await Future.delayed(Duration(seconds: 1));
      points(800);
    }
  }
}
