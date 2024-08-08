class QuizItem {
  final String question;
  final String answer;
  final String answerExplanation;

  QuizItem({
    required this.question,
    required this.answer,
    required this.answerExplanation,
  });

  factory QuizItem.fromJson(Map<String, dynamic> json) {
    return QuizItem(
      question: json["question"] as String,
      answer: json["answer"] as String,
      answerExplanation: json["answerExplanation"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "question": question,
      "answer": answer,
      "answerExplanation": answerExplanation,
    };
  }
}
