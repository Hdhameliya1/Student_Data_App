// To parse this JSON data, do
//
//     final student = studentFromMap(jsonString);

import 'dart:convert';

Student studentFromMap(String str) => Student.fromMap(json.decode(str));

String studentToMap(Student data) => json.encode(data.toMap());

class Student {
  int? id;
  String? name;
  List<Score>? scores;

  Student({
    this.id,
    this.name,
    this.scores,
  });

  factory Student.fromMap(Map<String, dynamic> json) => Student(
        id: json["_id"],
        name: json["name"],
        scores: json["scores"] == null
            ? []
            : List<Score>.from(json["scores"]!.map((x) => Score.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "scores": scores == null
            ? []
            : List<dynamic>.from(scores!.map((x) => x.toMap())),
      };
}

class Score {
  double? score;
  String? type;

  Score({
    this.score,
    this.type,
  });

  factory Score.fromMap(Map<String, dynamic> json) => Score(
        score: json["score"]?.toDouble(),
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "score": score,
        "type": type,
      };
}
