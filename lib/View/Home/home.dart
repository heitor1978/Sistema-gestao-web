import 'package:flutter/material.dart';
import 'package:gestao_web/View/CollaboratorActive/collaborator_active.dart';
import 'package:gestao_web/theme/theme.dart';
import 'package:gestao_web/Widgets/export_all_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  int indexNavigatorBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      drawer: const CustomDrawer(),
      appBar: const CustomAppBarHome(
        icon: Icon(
          Icons.screen_search_desktop_sharp,
          color: Color.fromARGB(255, 240, 240, 240),
        ),
        title: "Bem-vindo",
      ),
      body: PageView(
        onPageChanged: (int page) {
          setState(() {
            indexNavigatorBar = page;
          });
        },
        controller: _pageController,
        children: [
          CollaboratorActive(),
        ],
      ),
    );
  }
}
