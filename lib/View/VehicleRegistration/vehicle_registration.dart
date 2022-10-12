
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestao_web/Models/vehicle_model.dart';
import 'package:gestao_web/Services/VehicleService/vehicle_service.dart';
import 'package:gestao_web/Theme/theme.dart';
import 'package:gestao_web/widgets/export_all_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class VehicleRegistration extends StatefulWidget {
  const VehicleRegistration({
    Key? key,
  }) : super(key: key);

  @override
  State<VehicleRegistration> createState() => _VehicleRegistrationState();
}

class _VehicleRegistrationState extends State<VehicleRegistration> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  String board = '';
  String vehicleYear = '';
  String vehicleModelo = '';
  String vehicleBrand = '';
  String typeFuel = '';
  String? imageName;
  String? image;
  String? dropdownVehicleActive;

  bool vehicleActiveSave = false;

  final TextEditingController _controllerBoard = TextEditingController();
  final TextEditingController _controllerVehicleYear = TextEditingController();
  final TextEditingController _controllerVehicleModel = TextEditingController();
  final TextEditingController _controllerVehicleBrand = TextEditingController();
  final TextEditingController _controllerTypeFuel = TextEditingController();

  void save(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if(dropdownVehicleActive == "Operação"){
        vehicleActiveSave = true;
      }
      VehicleModel model = VehicleModel(
        veiculoAtivo: vehicleActiveSave,
        placa: _controllerBoard.text,
        anoVeiculo: _controllerVehicleYear.text,
        versaoVeiculo: _controllerVehicleModel.text,
        marca: _controllerVehicleBrand.text,
        uid: null,
        tipoCombustivel: _controllerTypeFuel.text,
        imagem: null,
      );
      VehicleService().registration(model, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      drawer: CustomDrawer(),
      appBar: const CustomAppBarHome(
        title: "Cadastro de Veiculos",
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  onSaved: (value) => board = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo placa é obrigatorio!";
                    }
                    return null;
                  },
                  controller: _controllerBoard,
                  labelText: "Placa do Veiculo",
                  placeholder: "AAA-0000",
                ),
                CustomTextField(
                  onSaved: (value) => vehicleYear = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Ano do Veiculo é obrigatório";
                    }
                    return null;
                  },
                  controller: _controllerVehicleYear,
                  labelText: "Ano do Veiculo",
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  placeholder: "2022",
                ),
                CustomTextField(
                  onSaved: (value) => vehicleModelo = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Modelo do Veiculo é obrigatório";
                    }
                    return null;
                  },
                  controller: _controllerVehicleModel,
                  labelText: "Versão Veiculo",
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  placeholder: "Mercedes Benz Axor 2544",
                ),
                CustomTextField(
                  onSaved: (value) => vehicleBrand = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Marca é obrigatório";
                    }
                    return null;
                  },
                  controller: _controllerVehicleBrand,
                  labelText: "Marca do Veiculo",
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  placeholder: "Mercedes",
                ),
                CustomDropdown(
                  labelText: "Selecione a Condição do Veiculo",
                  hintText: "Selecione a Condição do Veiculo",
                  value: dropdownVehicleActive,
                  onChanged: (Object? jobRole) {
                    setState(() {
                      dropdownVehicleActive = jobRole!.toString();
                    });
                    throw "";
                  },
                  items: vehicleActive.map((String vehicleActive) {
                    return DropdownMenuItem(
                      value: vehicleActive,
                      child: Text(vehicleActive),
                    );
                  }).toList(),
                ),
                CustomTextField(
                  onSaved: (value) => typeFuel = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo Tipo de Combustivel é obrigatório";
                    }
                    return null;
                  },
                  controller: _controllerTypeFuel,
                  labelText: "Tipo de Combustivel",
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  placeholder: "Diesel",
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextButton(
                  buttonText: "Cadastrar",
                  onPressed: () => save(context),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  final vehicleActiveSelected = TextEditingController();
  List<String> vehicleActive = [
    "Manutenção",
    "Operação",
  ];
}
