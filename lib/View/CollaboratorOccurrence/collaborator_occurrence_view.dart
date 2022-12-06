import 'package:flutter/material.dart';
import 'package:gestao_web/View/CollaboratorOccurrence/collaborator_occurrence_container.dart';
import 'package:gestao_web/View/CollaboratorRegistration/collaborator_registration.dart';
import 'package:gestao_web/View/export_all_view.dart';
import 'package:gestao_web/Widgets/export_all_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class CollaboratorOccurrence extends StatefulWidget {
  final String? uid;
  const CollaboratorOccurrence({super.key, this.uid});

  @override
  State<CollaboratorOccurrence> createState() => _CollaboratorOccurrenceState();
}

class _CollaboratorOccurrenceState extends State<CollaboratorOccurrence> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int indexNavigatorBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        appBar: CustomAppBarHome(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.keyboard_return_rounded)),
            title: "Ocorrências dos Funcionários"),
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
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Row(
                    children: [
                      Text(
                        "Ocorrência do Motorista",
                        style: GoogleFonts.poppins(fontSize: 17),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Divider(
                    color: Color.fromARGB(255, 1224, 227, 231),
                    indent: 15,
                    endIndent: 15,
                    thickness: 2,
                    height: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(45, 15, 150, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ocorrência",
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          "Observação",
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          "Data/Hora",
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: CollaboratorOccurrenceContainer(uid: widget.uid),
                )
              ],
            ),
          ),
        ]));
  }
}
