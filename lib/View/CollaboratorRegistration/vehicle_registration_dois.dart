import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_web/View/export_all_view.dart';
import 'package:gestao_web/Widgets/AppBar/custom_appbar.dart';
import 'package:gestao_web/Widgets/Dropdown/custom_dropdown.dart';
import 'package:gestao_web/Widgets/export_all_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../CollaboratorActive/collaborator_active.dart';

void main() => runApp(const CollaboratorRegistrationDois());

class CollaboratorRegistrationDois extends StatefulWidget {
  const CollaboratorRegistrationDois({Key? key}) : super(key: key);

  @override
  State<CollaboratorRegistrationDois> createState() =>
      _CollaboratorRegistrationDoisState();
}

class _CollaboratorRegistrationDoisState
    extends State<CollaboratorRegistrationDois> {
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
                    label: Text("Colaboradores             ")),
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                      child: TextFormField(
                        maxLength: 60,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          filled: true,
                          icon: const Icon(Icons.person),
                          hintText: "Como podemos Chama-lo?",
                          labelText: "Nome",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                      child: TextFormField(
                        maxLength: 14,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          filled: true,
                          icon: const Icon(Icons.phone),
                          hintText: "Numero de Telefone",
                          labelText: "Como podemos falar com ele?",
                          prefixText: '+55 ',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                      child: TextFormField(
                        maxLength: 80,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          filled: true,
                          icon: const Icon(Icons.email),
                          hintText: "Endereço de e-mail do colaborador",
                          labelText: "E-mail",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                      child: TextFormField(
                        maxLength: 8,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          filled: true,
                          icon: const Icon(Icons.password),
                          hintText: "Digite a senha do colaborador",
                          labelText: "Senha",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                      child: TextFormField(
                        maxLength: 8,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          filled: true,
                          icon: const Icon(Icons.password),
                          labelText: "Digite a senha novamente",
                        ),
                      ),
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
              ),
            ],
          ))
        ],
      ),
    );
  }
}
