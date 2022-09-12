import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:gestao_web/Models/vehicle_model.dart';

import 'package:uuid/uuid.dart';

class VehicleException implements Exception {
  String message;
  VehicleException(this.message);
}

class VehicleService extends ChangeNotifier {
  final firestore = FirebaseFirestore.instance;
  Map<int, Map<String, dynamic>> itens = {};
  Map<int, Map<String, dynamic>> sizes = {};

  registration(VehicleModel model, BuildContext context) {
    var uuid = const Uuid();
    var uidVehicle = uuid.v1();
    try {
      firestore.collection('veiculos').doc(uidVehicle).set({
        "placa": model.placa,
        "anoVeiculo": model.anoVeiculo,
        "versaoVeiculo": model.versaoVeiculo,
        "marca": model.marca,
        "uid": uidVehicle,
        "tipoCombustivel": model.tipoCombustivel,
        "imagem": model.imagem,
      });
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }

    Navigator.of(context).pop();
  }


  getAllVehicle() {
    return firestore
        .collection('veiculos')
        .get();
  }

  update(VehicleModel model, BuildContext context) async {
    try {
      await firestore.collection('veiculos').doc(model.uid).update({
        "placa": model.placa,
        "anoVeiculo": model.anoVeiculo,
        "versaoVeiculo": model.versaoVeiculo,
        "marca": model.marca,
        "tipoCombustivel": model.tipoCombustivel,
        "imagem": model.imagem,
      });
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }

    Navigator.of(context).pop();
  }
}
