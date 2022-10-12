import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gestao_web/Models/collaboratordocumentation_model.dart';
import 'package:gestao_web/Services/CollaboratorDocumentationService/collaboratordocumentation_service.dart';
import 'package:gestao_web/Widgets/export_all_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:gestao_web/Services/Validators/user_validator.dart';
import 'package:gestao_web/Services/ControllerService/collaborator_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CollaboratorDocumentation extends StatefulWidget {
  final String? uid;
  const CollaboratorDocumentation({super.key, required this.uid});
  @override
  State<CollaboratorDocumentation> createState() =>
      _CollaboratorDocumentationState();
}

class _CollaboratorDocumentationState extends State<CollaboratorDocumentation> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  CollaboratorControllerService controller = CollaboratorControllerService();
  String? fileName;
  Uint8List? file;

  void getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    file = result!.files.first.bytes;
    fileName = result.files.first.name;
  }

  void save(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await storage.ref().child("documentation/$fileName").putData(file!);
      var fileURL = await storage.ref().child("documentation/$fileName").getDownloadURL();
      
      CollaboratorDocumentationModel model = CollaboratorDocumentationModel(
        name: controller.name!.text.trim(),
        file: fileURL,
        uid: widget.uid,
      );
      CollaboratorDocumentationService().registration(model, context);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBarHome(
        title: "Documentações de Viagem",
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            CustomTextField(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              controller: controller.name,
              labelText: 'Nome do Arquivo',
              validator: (value) => UserValidator.validarNomeDocumento(value!),
            ),
            CustomTextButton(
              buttonText: 'Selecione o Arquivo', 
              onPressed: () {
                getFile();
              }
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
