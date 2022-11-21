import 'package:flutter/material.dart';
import 'package:gestao_web/View/ScreenStart/screen_start.dart';



class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScreenStart(),
      debugShowCheckedModeBanner: false,
    );
  }
}
