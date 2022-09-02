import 'package:flutter/material.dart';
import 'package:gestao_web/Services/AuthService/auth_service.dart';

import 'package:gestao_web/View/export_all_view.dart';

class RouteApp extends StatefulWidget {
  const RouteApp({Key? key}) : super(key: key);

  @override
  State<RouteApp> createState() => _RouteAppState();
}

class _RouteAppState extends State<RouteApp> {
  AuthService auth = AuthService();
  bool isLoading = true;
  String? route;

  setRoute() {
    setState(() {
      route = auth.getRoute();
      isLoading = false;
    });
  }

  getRoute() async {
    setState(() => isLoading = true);
    await auth.setRoute();
    setRoute();
  }

  @override
  Widget build(BuildContext context) {
        while (isLoading) {
      getRoute();
      while (route == "") {
        setRoute();
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return MaterialApp(
      routes: {
        '/': (context) => const Login(),
        '/home': (context) => const Home(),
      },
      initialRoute: route,
      debugShowCheckedModeBanner: false,
    );
  }
}
