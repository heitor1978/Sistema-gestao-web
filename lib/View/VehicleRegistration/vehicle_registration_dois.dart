import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_web/View/export_all_view.dart';
import 'package:gestao_web/Widgets/AppBar/custom_appbar.dart';
import 'package:gestao_web/Widgets/Dropdown/custom_dropdown.dart';
import 'package:gestao_web/Widgets/export_all_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../CollaboratorActive/collaborator_active.dart';

void main() => runApp(const VehicleRegistrationDois());

String? dropdownCondition;

class VehicleRegistrationDois extends StatefulWidget {
  const VehicleRegistrationDois({Key? key}) : super(key: key);

  @override
  State<VehicleRegistrationDois> createState() =>
      _VehicleRegistrationDoisState();
}

class _VehicleRegistrationDoisState extends State<VehicleRegistrationDois> {
  String? valueDropDownButtonType;
  String? valueDropDownButtonActive;

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
                    onPressed: () {},
                    icon: Icon(Icons.people_alt_outlined),
                    label: Text("Colaboradores                 ")),
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
          Expanded(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Row(
                  children: [
                    Text(
                      "Novos colaboradores",
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 15, 0),
                child: Divider(
                  color: Color.fromARGB(255, 1224, 227, 231),
                  indent: 15,
                  endIndent: 15,
                  thickness: 2,
                  height: 2,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  color: Color.fromARGB(255, 240, 240, 240),
                ),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                          child: TextFormField(
                            maxLength: 8,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              filled: true,
                              icon: const Icon(Icons.fire_truck_sharp),
                              hintText: "FRD-4486",
                              labelText: "Placa do Veiculo",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                          child: TextFormField(
                            maxLength: 20,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              filled: true,
                              icon: const Icon(Icons.fire_truck_sharp),
                              hintText: "Mercedes",
                              labelText: "Marca do Veiculo",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                          child: TextFormField(
                            maxLength: 20,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              filled: true,
                              icon: const Icon(Icons.developer_mode_sharp),
                              hintText: "Atego 3030",
                              labelText: "Modelo do Veiculo",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                          child: TextFormField(
                            maxLength: 4,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              filled: true,
                              icon: const Icon(Icons.fire_truck_sharp),
                              hintText: "2012",
                              labelText: "Ano do Veiculo",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                          child: TextFormField(
                            maxLength: 10,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              filled: true,
                              icon: const Icon(Icons.local_gas_station),
                              hintText: "Diesel",
                              labelText: "Tipo de Combustivel",
                            ),
                          ),
                        ),
                        CustomDropdown(
                          labelText: "Selecione o Cargo do Funcionario",
                          hintText: "Selecione o Cargo do Funcionario",
                          value: dropdownCondition,
                          onChanged: (Object? Condition) {
                            setState(() {
                              dropdownCondition = Condition!.toString();
                            });
                            throw "";
                          },
                          items: Condition.map((String Condition) {
                            return DropdownMenuItem(
                              value: Condition,
                              child: Text(Condition),
                            );
                          }).toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Enviar"),
                            ),
                          ),
                        ),
                        Text(
                          "Enviar formulário",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

final ConditionSelected = TextEditingController();
List<String> Condition = [
  "Motorista",
  "Administrativo",
];
