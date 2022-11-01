import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gestao_web/Widgets/AppBar/custom_appbar.dart';
import 'package:gestao_web/Widgets/Dropdown/custom_dropdown.dart';
import 'package:google_fonts/google_fonts.dart';

import '../CollaboratorActive/collaborator_active.dart';

void main() => runApp(const HomeDois());

class HomeDois extends StatefulWidget {
  const HomeDois({Key? key}) : super(key: key);

  @override
  State<HomeDois> createState() => _HomeDoisState();
}

class _HomeDoisState extends State<HomeDois> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAligment = -1.0;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  int indexNavigatorBar = 0;

  String? valueDropDownButtonType;
  String? valueDropDownButtonActive;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarHome(
        icon: Icon(Icons.home),
        title: 'Home',
      ),
      body: Row(
        children: <Widget>[
          Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 30),
                child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.people_alt_outlined),
                    label: Text("Colaboradores Ativo       ")),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 30),
                child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.fire_truck),
                    label: Text("Cadastro de veiculo        ")),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 30),
                child: ElevatedButton.icon(
                    onPressed: () {},
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
                      "E-mail",
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
              Container(
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color.fromARGB(255, 240, 240, 240),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 17,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Alex Gomes Da Silva Filho",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            "alex.gsan11@gmail.com",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            "646.312.626-32",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}

List<String> ListType = ["Motoristas", "Administradores"];
List<String> Active = ["Ativos", "Desativados"];
