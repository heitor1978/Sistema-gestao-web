import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gestao_web/Models/collaborator_model.dart';
import 'package:gestao_web/Services/AuthService/auth_service.dart';
import 'package:gestao_web/Services/ControllerService/collaborator_controller.dart';
import 'package:gestao_web/Services/Validators/user_validator.dart';
import 'package:gestao_web/Theme/theme.dart';
import 'package:gestao_web/Widgets/export_all_widget.dart';
import 'package:gestao_web/theme/theme.dart';

import 'package:brasil_fields/brasil_fields.dart';

class CollaboratorRegistration extends StatefulWidget {
  const CollaboratorRegistration({Key? key}) : super(key: key);

  @override
  State<CollaboratorRegistration> createState() =>
      _CollaboratorRegistrationState();
}

class _CollaboratorRegistrationState extends State<CollaboratorRegistration> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CollaboratorControllerService controller = CollaboratorControllerService();

  AuthService auth = AuthService();

  bool isLoading = false;
  bool admin = false;

  String? dropdownJobRole;

  void save(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      formKey.currentState!.save();
      try {
        if (dropdownJobRole == "Administrativo") {
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
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      drawer: const CustomDrawer(),
      appBar: const CustomAppBarHome(
        title: "Cadastro de Funcionario",
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                Card(
                  margin: EdgeInsets.all(20),
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            controller: controller.name,
                            labelText: 'Nome',
                            validator: (value) =>
                                UserValidator.validarNome(value!),
                          ),
                          CustomTextField(
                            controller: controller.email,
                            inputType: TextInputType.emailAddress,
                            labelText: 'E-mail',
                            validator: (value) =>
                                UserValidator.validarEmail(value!),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField(
                            controller: controller.cellphone,
                            labelText: 'Telefone',
                            inputType: TextInputType.number,
                            validator: (value) =>
                                UserValidator.validarTelefone(value!),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              TelefoneInputFormatter(),
                            ],
                          ),
                          CustomTextField(
                            controller: controller.cpf,
                            labelText: 'CPF',
                            inputType: TextInputType.number,
                            validator: (value) =>
                                UserValidator.validarCPF(value!),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CpfInputFormatter()
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomDropdown(
                            labelText: "Selecione o Cargo do Funcionario",
                            hintText: "Selecione o Cargo do Funcionario",
                            value: dropdownJobRole,
                            onChanged: (Object? jobRole) {
                              setState(() {
                                dropdownJobRole = jobRole!.toString();
                              });
                              throw "";
                            },
                            items: jobRole.map((String jobRole) {
                              return DropdownMenuItem(
                                value: jobRole,
                                child: Text(jobRole),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField(
                            controller: controller.password,
                            labelText: 'Senha',
                            validator: (value) =>
                                UserValidator.validarSenha(value!),
                            obscureText: true,
                          ),
                          CustomTextField(
                            controller: controller.confirmPassword,
                            labelText: 'Confirmar senha',
                            obscureText: true,
                            validator: (value) =>
                                UserValidator.validarConfirmarSenha(
                                    value!, controller.password!.text),
                          ),
                        ],
                      ),
                      (isLoading)
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Color.fromARGB(255, 0, 156, 211),
                              ),
                            )
                          : CustomTextButton(
                              buttonText: 'Cadastrar',
                              onPressed: () {
                                save(context);
                                auth.logout(context);
                              }),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  final jobRoleSelected = TextEditingController();
  List<String> jobRole = [
    "Motorista",
    "Administrativo",
  ];
}
