import 'dart:convert';

class QuestionModel {
  final String title;
  final String correct;
  final String wrong1;
  final String wrong2;
  final String wrong3;
  final String? photo;
  QuestionModel({
    required this.title,
    required this.correct,
    required this.wrong1,
    required this.wrong2,
    required this.wrong3,
    this.photo,
  });

  QuestionModel copyWith({
    String? title,
    String? correct,
    String? wrong1,
    String? wrong2,
    String? wrong3,
    String? photo,
  }) {
    return QuestionModel(
      title: title ?? this.title,
      correct: correct ?? this.correct,
      wrong1: wrong1 ?? this.wrong1,
      wrong2: wrong2 ?? this.wrong2,
      wrong3: wrong3 ?? this.wrong3,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'correct': correct,
      'wrong1': wrong1,
      'wrong2': wrong2,
      'wrong3': wrong3,
      'photo': photo,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'] ?? '',
      correct: map['correct'] ?? '',
      wrong1: map['wrong1'] ?? '',
      wrong2: map['wrong2'] ?? '',
      wrong3: map['wrong3'] ?? '',
      photo: map['photo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuestionModel(title: $title, correct: $correct, wrong1: $wrong1, wrong2: $wrong2, wrong3: $wrong3, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuestionModel &&
        other.title == title &&
        other.correct == correct &&
        other.wrong1 == wrong1 &&
        other.wrong2 == wrong2 &&
        other.wrong3 == wrong3 &&
        other.photo == photo;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        correct.hashCode ^
        wrong1.hashCode ^
        wrong2.hashCode ^
        wrong3.hashCode ^
        photo.hashCode;
  }
}
