import 'package:flutter/material.dart';
import 'package:gestao_web/View/CollaboratorOccurrence/collaborator_occurrence_container.dart';
import 'package:gestao_web/View/export_all_view.dart';
import 'package:gestao_web/Widgets/export_all_widget.dart';

class CollaboratorOccurrence extends StatefulWidget {
  final String? uid;
  const CollaboratorOccurrence({super.key, this.uid});

  @override
  State<CollaboratorOccurrence> createState() => _CollaboratorOccurrenceState();
}

class _CollaboratorOccurrenceState extends State<CollaboratorOccurrence> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  int indexNavigatorBar = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      drawer: CustomDrawer(),
      appBar: CustomAppBarHome(title: "Ocorrências dos Funcionários"),

      body: PageView(
        onPageChanged: (int page) {
          setState(() {
            indexNavigatorBar = page;
          });
        },
        controller: _pageController,
        children: [
          CollaboratorOccurrenceContainer(uid: widget.uid),
        ],
      ),
    );
  }
}
