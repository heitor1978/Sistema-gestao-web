import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:gestao_web/Models/collaboratordocumentation_model.dart';

import 'package:uuid/uuid.dart';

class CollaboratorDocumentationException implements Exception {
  String message;
  CollaboratorDocumentationException(this.message);
}

class CollaboratorDocumentationService extends ChangeNotifier {
  final firestore = FirebaseFirestore.instance;

  registration(CollaboratorDocumentationModel model, BuildContext context) {
    var uidCollaboratorDocumentation = Uuid().v1();
    try {
      firestore.collection('funcionarios').doc(model.uid).collection('documentacao').doc(uidCollaboratorDocumentation).set({
        "nome": model.name,
        "arquivo": model.file,
        "uid": model.uid,
        "uidDocumento": uidCollaboratorDocumentation,
      });
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }

    Navigator.of(context).pop();
  }
}

