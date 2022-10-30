import 'package:flutter/material.dart';
import 'package:gestao_web/View/export_all_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //home: Login(),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
