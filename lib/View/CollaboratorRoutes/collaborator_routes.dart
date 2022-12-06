import 'package:flutter/material.dart';
import 'package:gestao_web/Services/Validators/user_validator.dart';
import 'package:gestao_web/View/CollaboratorRegistration/collaborator_registration.dart';
import 'package:gestao_web/Widgets/export_all_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
import 'package:gestao_web/View/export_all_view.dart';

class CollaboratorRoutes extends StatefulWidget {
  final String? uid;
  const CollaboratorRoutes({super.key, this.uid});

  @override
  State<CollaboratorRoutes> createState() => _CollaboratorRoutesState();
}

class _CollaboratorRoutesState extends State<CollaboratorRoutes> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController latitude = TextEditingController();
  final TextEditingController longitude = TextEditingController();
  final TextEditingController nomeRota = TextEditingController();

  void save(BuildContext context) async {
    var uidCollaboratorRoutes = Uuid().v1();
    var latitudeDouble = double.parse(latitude.text);
    var longitudeDouble = double.parse(longitude.text);
    if (formKey.currentState!.validate()) {
      firestore
          .collection('funcionarios')
          .doc(widget.uid)
          .collection('rotas')
          .doc(uidCollaboratorRoutes)
          .set({
        "nomeRota": nomeRota.text,
        "localizacaoAtual": GeoPoint(latitudeDouble, longitudeDouble),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarHome(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.keyboard_return_rounded)),
        title: "Cadastro de Viagem",
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
                  child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Row(
                    children: [
                      Text(
                        "Cadastro de Viagem",
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                        child: TextFormField(
                          maxLength: 35,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            filled: true,
                            icon: Icon(Icons.route),
                            hintText: "Balsamo",
                            labelText: "Nome da Viagem",
                          ),
                          controller: nomeRota,
                          validator: (value) =>
                              UserValidator.validarLocalizacao(value!),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                        child: TextFormField(
                          maxLength: 14,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            filled: true,
                            icon: Icon(Icons.threesixty),
                            hintText: "1°24'12.2N 2°10'26.5E.",
                            labelText: "Latitude",
                          ),
                          controller: latitude,
                          validator: (value) =>
                              UserValidator.validarLocalizacao(value!),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                        child: TextFormField(
                          maxLength: 14,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            filled: true,
                            icon: Icon(Icons.threesixty),
                            hintText: "1°24'12.2N 2°10'26.5E.",
                            labelText: "Longitude",
                          ),
                          controller: longitude,
                          validator: (value) =>
                              UserValidator.validarLocalizacao(value!),
                        ),
                      ),
                      CustomTextButton(
                          buttonText: 'Cadastrar',
                          onPressed: () {
                            save(context);
                            Navigator.of(context).pop();
                          }),
                    ],
                  ),
                )
              ])),
            ],
          )),
    );
  }
}
