import 'dart:convert';

import 'package:friends_quiz/app/modules/question/entity/question_model.dart';
import 'package:http/http.dart' as http;

class QuestionRepository {
  Future<List<dynamic>> getQuestions(int difficulty) async {
    final url = Uri.http("marcelo.erickalves.com.br", "quiz/$difficulty");
    final response = await http.get(url);
    var map = jsonDecode(response.body);
    var list = map.map((e) => QuestionModel.fromMap(e)).toList();
    return list;
  }
}
