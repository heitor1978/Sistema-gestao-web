import 'package:flutter/material.dart';
import 'package:gestao_web/Widgets/export_all_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestao_web/Services/Validators/user_validator.dart';
import 'package:uuid/uuid.dart';

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
    if(formKey.currentState!.validate()){
      firestore.collection('funcionarios').doc(widget.uid).collection('rotas').doc(uidCollaboratorRoutes).set({
        "nomeRota": nomeRota.text,
        "localizacaoAtual": GeoPoint(latitudeDouble, longitudeDouble),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBarHome(
        title: "Cadastro de Viagem",
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            CustomTextField(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              controller: nomeRota,
              labelText: 'Nome da Viagem',
              validator: (value) => UserValidator.validarLocalizacao(value!),
            ),
            CustomTextField(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              controller: latitude,
              labelText: 'Latitude',
              validator: (value) => UserValidator.validarLocalizacao(value!),
            ),
            CustomTextField(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              controller: longitude,
              labelText: 'Longitude',
              validator: (value) => UserValidator.validarNomeDocumento(value!),
            ),
            CustomTextButton(
                buttonText: 'Cadastrar',
                onPressed: () {
                  save(context);
                }),
          ],
        ),
      ),
    );
  }
}