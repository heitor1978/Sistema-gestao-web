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
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(150, 50, 150, 0),
              child: TextFormField(
                maxLength: 14,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  filled: true,
                  icon: Icon(Icons.route),
                  hintText: "Balsamo",
                  labelText: "Nome da Viagem",
                ),
                controller: nomeRota,
                validator: (value) => UserValidator.validarLocalizacao(value!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(150, 50, 150, 0),
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
                validator: (value) => UserValidator.validarLocalizacao(value!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(150, 50, 150, 50),
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
                    UserValidator.validarNomeDocumento(value!),
              ),
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
