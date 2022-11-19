import 'package:flutter/material.dart';
import 'package:gestao_web/View/CollaboratorOccurrence/collaborator_occurrence_container.dart';
import 'package:gestao_web/View/CollaboratorRegistration/collaborator_registration.dart';
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
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        appBar: CustomAppBarHome(title: "Ocorrências dos Funcionários"),
        body: Row(children: <Widget>[
          Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 30),
                child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                    },
                    icon: Icon(Icons.people_alt_outlined),
                    label: Text("Colaboradores                 ")),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 30),
                child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => VehicleRegistration(),
                      ));
                    },
                    icon: Icon(Icons.fire_truck),
                    label: Text("Cadastro de veiculo        ")),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 30),
                child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CollaboratorRegistration(),
                      ));
                    },
                    icon: Icon(Icons.addchart_outlined),
                    label: Text("Cadastro de Colaborador")),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: CollaboratorOccurrenceContainer(uid: widget.uid),)
        ]));
  }
}
