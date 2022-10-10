import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gestao_web/Models/collaboratordocumentation_model.dart';
import 'package:gestao_web/Services/CollaboratorDocumentationService/collaboratordocumentation_service.dart';
import 'package:gestao_web/Theme/theme.dart';
import 'package:gestao_web/Widgets/export_all_widget.dart';
import 'package:gestao_web/View/export_all_view.dart';
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

    print(result);

    if(result == null) return;
    
  }

  void save(BuildContext context) async {
    await storage.ref().child("documentation/$fileName").putData(file!);
    var fileURL = await storage.ref().getDownloadURL();

    if (formKey.currentState!.validate()) {
      CollaboratorDocumentationModel model = CollaboratorDocumentationModel(
        name: controller.name!.text.trim(),
        file: fileURL,
        uid: widget.uid,
      );
      CollaboratorDocumentatioService().registration(model, context, widget.uid);
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
            InkWell(
              child: Container(
                margin: const EdgeInsets.fromLTRB(500, 15, 500, 10),
                width: MediaQuery.of(context).size.width,
                height: 70,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(25, 10, 10, 10),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: primaryColor,
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Selecione o Arquivo",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: getFile,
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
