import 'dart:convert';

import 'package:http/http.dart' as http;

import '../entity/question_model.dart';

class QuestionRepository {
  Future<List<dynamic>> getQuestions(int difficulty) async {
    final url = Uri.http("marcelo.erickalves.com.br", "quiz/$difficulty");
    final response = await http.get(url);
    var map = jsonDecode(response.body);
    var list = map.map((e) => QuestionModel.fromMap(e)).toList();
    return list;
  }
}
