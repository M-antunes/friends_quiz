import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/challange_choice/presenter/pages/challange_choice_page.dart';
import 'modules/questions/presenter/controller/question_controller.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuestionController()),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: ChallangeChoicePage(),
      ),
    );
  }
}
