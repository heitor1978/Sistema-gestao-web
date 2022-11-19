import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_web/View/export_all_view.dart';
import 'package:gestao_web/Widgets/Dropdown/custom_dropdown_web.dart';
import 'package:gestao_web/Widgets/export_all_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gestao_web/Services/ControllerService/collaborator_controller.dart';
import 'package:gestao_web/Services/AuthService/auth_service.dart';
import 'package:gestao_web/Models/collaborator_model.dart';
import 'package:gestao_web/Services/Validators/user_validator.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CollaboratorRegistration extends StatefulWidget {
  const CollaboratorRegistration({Key? key}) : super(key: key);

  @override
  State<CollaboratorRegistration> createState() =>
      _CollaboratorRegistrationState();
}

class _CollaboratorRegistrationState extends State<CollaboratorRegistration> {
  final firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? valueDropDownButtonType;
  String? valueDropDownButtonActive;
  String? name;
  String? cellphone;
  String? email;
  String? cpf;
  String? password;
  String? confirmPassword;

  String? dropdownTypeCollaborator;

  CollaboratorControllerService controller = CollaboratorControllerService();

  AuthService auth = AuthService();

  bool admin = false;
  bool isLoading = false;

  void save(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      formKey.currentState!.save();
      try {
        if (dropdownTypeCollaborator == "Administrativo") {
          admin = true;
        }
        CollaboratorModel model = CollaboratorModel(
          nome: controller.name!.text.trim(),
          uid: null,
          telefone: controller.cellphone!.text,
          cpf: controller.cpf!.text,
          admin: admin,
        );

        await auth.register(
          controller.email!.text.trim(),
          controller.password!.text.trim(),
          model,
          context,
        );
      } on AuthException catch (e) {
        setState(() => isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    } else {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarHome(
          title: "Cadastro de Colaboradores",
        ),
        body: Form(
          key: formKey,
          child: Row(
            children: [
              Column(
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
                                onSaved: (value) => name = value!,
                                controller: controller.name,
                                maxLength: 60,
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.words,
                                validator: (value) =>
                                    UserValidator.validarNome(value!),
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
                                onSaved: (value) => cellphone = value!,
                                controller: controller.cellphone,
                                maxLength: 19,
                                textInputAction: TextInputAction.next,
                                validator: (value) =>
                                    UserValidator.validarTelefone(value!),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  TelefoneInputFormatter(),
                                ],
                                decoration: InputDecoration(
                                  filled: true,
                                  icon: const Icon(Icons.phone),
                                  hintText: "Numero de Telefone",
                                  labelText: "Como podemos falar com ele?",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                              child: TextFormField(
                                onSaved: (value) => email = value!,
                                controller: controller.email,
                                maxLength: 80,
                                textInputAction: TextInputAction.next,
                                validator: (value) =>
                                    UserValidator.validarEmail(value!),
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
                                onSaved: (value) => cpf = value!,
                                controller: controller.cpf,
                                maxLength: 80,
                                validator: (value) =>
                                    UserValidator.validarCPF(value!),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  CpfInputFormatter()
                                ],
                                decoration: InputDecoration(
                                  filled: true,
                                  icon: const Icon(Icons.person),
                                  hintText: "CPF do Colaborador",
                                  labelText: "CPF",
                                ),
                              ),
                            ),
                            CustomDropdownRegister(
                              labelText: "Selecione o Cargo do Funcionario",
                              hintText: "Selecione o Cargo do Funcionario",
                              value: dropdownTypeCollaborator,
                              onChanged: (Object? TypeCollaborator) {
                                setState(() {
                                  dropdownTypeCollaborator =
                                      TypeCollaborator!.toString();
                                });
                                throw "";
                              },
                              items: TypeCollaborator.map(
                                  (String TypeCollaborator) {
                                return DropdownMenuItem(
                                  value: TypeCollaborator,
                                  child: Text(TypeCollaborator),
                                );
                              }).toList(),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                              child: TextFormField(
                                onSaved: (value) => password = value!,
                                controller: controller.password,
                                maxLength: 20,
                                textInputAction: TextInputAction.next,
                                validator: (value) =>
                                    UserValidator.validarSenha(value!),
                                obscureText: true,
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
                                onSaved: (value) => confirmPassword = value!,
                                controller: controller.confirmPassword,
                                maxLength: 8,
                                textInputAction: TextInputAction.next,
                                obscureText: true,
                                validator: (value) =>
                                    UserValidator.validarConfirmarSenha(value!,
                                        controller.confirmPassword!.text),
                                decoration: InputDecoration(
                                  filled: true,
                                  icon: const Icon(Icons.password),
                                  labelText: "Digite a senha novamente",
                                ),
                              ),
                            ),
                            (isLoading)
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Center(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          save(context);
                                          auth.logout(context);
                                        },
                                        child: Text("Cadastrar"),
                                      ),
                                    ),
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
        ));
  }
}

final ConditionSelected = TextEditingController();
List<String> TypeCollaborator = [
  "Motorista",
  "Administrativo",
];
