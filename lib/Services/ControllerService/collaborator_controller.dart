import 'package:flutter/material.dart';

class ControllerCollaboratorException implements Exception {
  String message;
  ControllerCollaboratorException(this.message);
}

class CollaboratorControllerService extends TextEditingController {
  String? page;
  TextEditingController? name;
  TextEditingController? email;
  TextEditingController? cellphone;
  TextEditingController? cpf;
  TextEditingController? password;
  TextEditingController? confirmPassword;

  CollaboratorControllerService() {
    _collaboratorControllerService();
  }

  _collaboratorControllerService() {
    name = TextEditingController();
    email = TextEditingController();
    cellphone = TextEditingController();
    cpf = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }
}
