import "package:prescamai/models/quiz_model.dart";

class Scam {
  final String id;
  final String title;
  final String img;
  final String description;
  final String longDescription;
  final String aiIdentity;
  final String exampleInput;
  final String exampleModel;
  final int count;
  final List<String> identify;
  final List<QuizItem> quiz;

  Scam(
      {required this.id,
      required this.title,
      required this.img,
      required this.description,
      required this.longDescription,
      required this.aiIdentity,
      required this.exampleInput,
      required this.exampleModel,
      required this.count,
      required this.identify,
      required this.quiz});

  factory Scam.fromJson(Map<String, dynamic> json) {
    return Scam(
      id: json["id"] as String,
      title: json["title"] as String,
      img: json["img"] as String,
      description: json["description"] as String,
      longDescription: json["longDescription"] as String,
      aiIdentity: (json["aiIdentity"] ?? "") as String,
      exampleInput: (json["exampleInput"] ?? "") as String,
      exampleModel: (json["exampleModel"] ?? "") as String,
      count: json["count"] as int,
      identify: List<String>.from(json["identify"]),
      quiz: (json["quiz"] as List)
          .map((item) => QuizItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "img": img,
      "description": description,
      "longDescription": longDescription,
      "aiIdentity": aiIdentity,
      "exampleInput": exampleInput,
      "exampleModel": exampleModel,
      "count": count,
      "identify": identify,
      "quiz": quiz.map((item) => item.toJson()).toList(),
    };
  }
}

class ScamsList {
  final List<Scam> scams;

  ScamsList({required this.scams});

  factory ScamsList.fromJson(Map<String, dynamic> json) {
    return ScamsList(
      scams: (json["scams"] as List).map((i) => Scam.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "scams": scams.map((scam) => scam.toJson()).toList(),
    };
  }
}
