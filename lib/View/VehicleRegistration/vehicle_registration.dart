
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
  FirebaseStorage storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();
  File? imageFile;

  String board = '';
  String vehicleYear = '';
  String vehicleModelo = '';
  String vehicleBrand = '';
  String typeFuel = '';
  String? imageName;
  String? image;

  final TextEditingController _controllerBoard = TextEditingController();
  final TextEditingController _controllerVehicleYear = TextEditingController();
  final TextEditingController _controllerVehicleModel = TextEditingController();
  final TextEditingController _controllerVehicleBrand = TextEditingController();
  final TextEditingController _controllerTypeFuel = TextEditingController();

  void getImage() async {
    var file = await _picker.pickImage(source: ImageSource.gallery);
    imageFile = File(file!.path);
    var fileExtension = imageFile!.path.split('.').last;

    imageName = "${(DateTime.now().millisecondsSinceEpoch)}.$fileExtension";
  }

  void save(BuildContext context) async {
    /*if (imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("É preciso adicionar uma imagem do produto")),
      );
    } else {
      final storageRef = FirebaseStorage.instance.ref();
      storageRef.child("vehicle/" + imageName!).putFile(imageFile!);
      image = await storageRef.getDownloadURL();
    }*/
    if (formKey.currentState!.validate()) {
      VehicleModel model = VehicleModel(
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
                /*Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Adicionar Imagem do Veiculo",
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: getImage,
                    icon: Icon(Icons.linked_camera_rounded),
                    color: primaryColor,
                    iconSize: 50,
                  ),
                  /*CircleAvatar(
                    backgroundImage: AssetImage(productName),
                    //radius: ,
                  )*/
                ]),*/
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

  final categorySelected = TextEditingController();
}
