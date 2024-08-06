class Scam {
  final String id;
  final String title;
  final String img;
  final String description;
  final String longDescription;
  final int count;
  final List<String> identify;

  Scam({
    required this.id,
    required this.title,
    required this.img,
    required this.description,
    required this.longDescription,
    required this.count,
    required this.identify,
  });

  factory Scam.fromJson(Map<String, dynamic> json) {
    return Scam(
      id: json["id"] as String,
      title: json["title"] as String,
      img: json["img"] as String,
      description: json["description"] as String,
      longDescription: json["longDescription"] as String,
      count: json["count"] as int,
      identify: List<String>.from(json["identify"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "img": img,
      "description": description,
      "longDescription": longDescription,
      "count": count,
      "identify": identify,
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
