import 'package:flutter/material.dart';
import 'package:gestao_web/View/CollaboratorRegistration/collaborator_registration.dart';
import 'package:gestao_web/View/VehicleRegistration/vehicle_registration.dart';
import 'package:gestao_web/Widgets/AppBar/custom_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../CollaboratorActive/collaborator_active.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAligment = -1.0;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? valueDropDownButtonType;
  String? valueDropDownButtonActive;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarHome(
        title: "Home",
      ),
      body: Row(
        children: <Widget>[
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
                        builder: (context) =>
                            CollaboratorRegistration(),
                      ));
                    },
                    icon: Icon(Icons.addchart_outlined),
                    label: Text("Cadastro de Colaborador")),
              ),
            ],
          ),

          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Row(
                  children: [
                    Text(
                      "Colaboradores",
                      style: GoogleFonts.poppins(fontSize: 17),
                    )
                  ],
                ),
              ),
              /*Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Row(
                  //Row DropDownButton
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: Row(
                        children: [
                          Container(
                            child: CustomDropdown(
                                labelText: "Atividade",
                                hintText:
                                    "Selecione a atividade do colaborador",
                                value: valueDropDownButtonType,
                                onChanged: (value) {
                                  valueDropDownButtonType = value.toString();
                                },
                                items: ListType.map((value) {
                                  return DropdownMenuItem(
                                    child: Text(value),
                                    value: value,
                                  );
                                }).toList()),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              child: CustomDropdown(
                                  labelText: "Tipo",
                                  hintText: "Selecione o tipo de busca",
                                  value: valueDropDownButtonActive,
                                  onChanged: (value) {
                                    valueDropDownButtonActive =
                                        value.toString();
                                  },
                                  items: Active.map((value) {
                                    return DropdownMenuItem(
                                      child: Text(value),
                                      value: value,
                                    );
                                  }).toList()),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),*/
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
                padding: const EdgeInsets.fromLTRB(80, 15, 150, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nome",
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "Telefone",
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "CPF",
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(child: CollaboratorActive()),
            ],
          )),
        ],
      ),
    );
  }
}

List<String> ListType = ["Motoristas", "Administradores"];
List<String> Active = ["Ativos", "Desativados"];
