import 'package:flutter/material.dart';
import 'package:gestao_web/View/CollaboratorCheckList/collaborator_checklist_container.dart';
import 'package:gestao_web/Widgets/export_all_widget.dart';


class CollaboratorChecklistView extends StatefulWidget {
  final String? uid;
  const CollaboratorChecklistView({super.key, this.uid});

  @override
  State<CollaboratorChecklistView> createState() =>
      _CollaboratorChecklistViewState();
}

class _CollaboratorChecklistViewState extends State<CollaboratorChecklistView> {
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
      appBar: CustomAppBarHome(title: "Checklist dos Funcionários"),
      body: PageView(
        onPageChanged: (int page) {
          setState(() {
            indexNavigatorBar = page;
          });
        },
        controller: _pageController,
        children: [
          CollaboratorChecklistContainer(uid: widget.uid),
        ],
      ),
    );
  }
}
