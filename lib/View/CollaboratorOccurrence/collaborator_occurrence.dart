import 'package:flutter/material.dart';
import 'package:gestao_web/View/export_all_view.dart';
import 'package:gestao_web/Widgets/export_all_widget.dart';

class CollaboratorOccurrence extends StatefulWidget {
  const CollaboratorOccurrence({super.key});

  @override
  State<CollaboratorOccurrence> createState() => _CollaboratorOccurrenceState();
}

class _CollaboratorOccurrenceState extends State<CollaboratorOccurrence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBarHome(title: "Ocorrências"),
    );
  }
}
