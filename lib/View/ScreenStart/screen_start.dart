import 'package:flutter/material.dart';
import 'package:gestao_web/Theme/theme.dart';
import 'package:gestao_web/Widgets/export_all_widget.dart';
import 'package:gestao_web/Services/AuthService/auth_service.dart';
import 'package:gestao_web/Services/Validators/user_validator.dart';

class ScreenStart extends StatefulWidget {
  const ScreenStart({super.key});

  @override
  State<ScreenStart> createState() => _ScreenStartState();
}

class _ScreenStartState extends State<ScreenStart> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthService auth = AuthService();
  bool loading = false;

  String? email = "", senha = "";

  _login(BuildContext context) async {
    setState(() => loading = true);
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await auth.login(email!, senha!, context);
      } on AuthException catch (e) {
        setState(() => loading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    } else {
      setState(() => loading = false);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "Portal Administrativo",
                style: TextStyle(fontSize: 20),
              ),
              accountEmail: Text(
                "Seja Bem Vindo",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              /*currentAccountPicture: Image.asset(
                'assets/images/chiquinho-logo.png',
                alignment: Alignment.center,
                width: 100,
                height: 100,
              ),*/  
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: CustomTextField(
                labelText: "E-mail",
                placeholder: "colaborador@email.com",
                inputType: TextInputType.emailAddress,
                onSaved: (value) => email = value,
                validator: (value) => UserValidator.validarEmail(value!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: CustomTextField(
                labelText: "Senha",
                placeholder: "********",
                obscureText: true,
                onSaved: (value) => senha = value,
                validator: (value) => UserValidator.validarSenha(value!),
              ),
            ),
            (loading)
                ? const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: CustomTextButton(
                      buttonText: "Entrar",
                      onPressed: () => _login(context),
                    ),
                  ),
          ],
        ),
      )),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ButtonBar(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF0D47A1),
                                  Color(0xFF1976D2),
                                  Color(0xFF42A5F5),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {},
                          child: const Text('Home'),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF0D47A1),
                                  Color(0xFF1976D2),
                                  Color(0xFF42A5F5),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {},
                          child: const Text('Sobre Nós'),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF0D47A1),
                                  Color(0xFF1976D2),
                                  Color(0xFF42A5F5),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {},
                          child: const Text('Contato'),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF0D47A1),
                                  Color(0xFF1976D2),
                                  Color(0xFF42A5F5),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {},
                          child: const Text('Politica de Segurança'),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF0D47A1),
                                  Color(0xFF1976D2),
                                  Color(0xFF42A5F5),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {},
                          child: const Text('serviços'),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Image.asset(
          'assets/images/caminhao1.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
