import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:gestao_web/Models/collaboratordocumentation_model.dart';

import 'package:uuid/uuid.dart';

class CollaboratorDocumentatioException implements Exception {
  String message;
  CollaboratorDocumentatioException(this.message);
}

class CollaboratorDocumentatioService extends ChangeNotifier {
  final firestore = FirebaseFirestore.instance;
  Map<int, Map<String, dynamic>> itens = {};
  Map<int, Map<String, dynamic>> sizes = {};

  registration(CollaboratorDocumentationModel model, BuildContext context, String? uid) {
    var uuid = const Uuid();
    var uidCollaboratorDocumentation = uuid.v1();
    try {
      firestore.collection('funcionarios').doc(uid).collection('documentacao').doc(uidCollaboratorDocumentation).set({
        "nome": model.name,
        "arquivo": model.file,
        "uid": model.uid,
      });
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }

    Navigator.of(context).pop();
  }
}

