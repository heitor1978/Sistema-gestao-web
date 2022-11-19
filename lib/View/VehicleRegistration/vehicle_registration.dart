import 'package:flutter/material.dart';
import 'package:gestao_web/View/CollaboratorRegistration/collaborator_registration.dart';
import 'package:gestao_web/Widgets/Dropdown/custom_dropdown_web.dart';
import 'package:gestao_web/Widgets/export_all_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gestao_web/View/export_all_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestao_web/Models/vehicle_model.dart';
import 'package:gestao_web/Services/VehicleService/vehicle_service.dart';

class VehicleRegistration extends StatefulWidget {
  const VehicleRegistration({Key? key}) : super(key: key);

  @override
  State<VehicleRegistration> createState() => _VehicleRegistrationState();
}

class _VehicleRegistrationState extends State<VehicleRegistration> {
  final firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? valueDropDownButtonType;
  String? valueDropDownButtonActive;
  String? dropdownCondition;

  String board = '';
  String vehicleYear = '';
  String vehicleModelo = '';
  String vehicleBrand = '';
  String typeFuel = '';
  String? imageName;
  String? image;

  bool vehicleActiveSave = false;

  final TextEditingController _controllerBoard = TextEditingController();
  final TextEditingController _controllerVehicleYear = TextEditingController();
  final TextEditingController _controllerVehicleModel = TextEditingController();
  final TextEditingController _controllerVehicleBrand = TextEditingController();
  final TextEditingController _controllerTypeFuel = TextEditingController();

  void save(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (dropdownCondition == "Operacional") {
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
        appBar: CustomAppBarHome(
          title: "Cadastro de Veiculo",
        ),
        body: Form(
          key: formKey,
          child: Row(
            children: <Widget>[
              Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 30),
                    child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Home(),
                          ));
                        },
                        icon: Icon(Icons.people_alt_outlined),
                        label: Text("Colaboradores                 ")),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 30),
                    child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VehicleRegistration(),
                          ));
                        },
                        icon: Icon(Icons.fire_truck),
                        label: Text("Cadastro de veiculo        ")),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 30),
                    child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CollaboratorRegistration(),
                          ));
                        },
                        icon: Icon(Icons.addchart_outlined),
                        label: Text("Cadastro de Colaborador")),
                  ),
                ],
              ),
              const VerticalDivider(thickness: 1, width: 1),
              Expanded(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Row(
                      children: [
                        Text(
                          "Cadastro de Veiculo",
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 15, 0),
                    child: Divider(
                      color: Color.fromARGB(255, 1224, 227, 231),
                      indent: 15,
                      endIndent: 15,
                      thickness: 2,
                      height: 2,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: Color.fromARGB(255, 240, 240, 240),
                    ),
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                              child: TextFormField(
                                onSaved: (value) => board = value!,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Campo placa é obrigatorio!";
                                  }
                                  return null;
                                },
                                maxLength: 8,
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.words,
                                controller: _controllerBoard,
                                decoration: InputDecoration(
                                  filled: true,
                                  icon: const Icon(Icons.fire_truck_sharp),
                                  hintText: "FRD-4486",
                                  labelText: "Placa do Veiculo",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                              child: TextFormField(
                                onSaved: (value) => vehicleBrand = value!,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Campo Marca é obrigatório";
                                  }
                                  return null;
                                },
                                controller: _controllerVehicleBrand,
                                maxLength: 20,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  filled: true,
                                  icon: const Icon(Icons.fire_truck_sharp),
                                  hintText: "Mercedes",
                                  labelText: "Marca do Veiculo",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                              child: TextFormField(
                                onSaved: (value) => vehicleModelo = value!,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Campo Modelo do Veiculo é obrigatório";
                                  }
                                  return null;
                                },
                                controller: _controllerVehicleModel,
                                maxLength: 20,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  filled: true,
                                  icon: const Icon(Icons.developer_mode_sharp),
                                  hintText: "Atego 3030",
                                  labelText: "Modelo do Veiculo",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                              child: TextFormField(
                                onSaved: (value) => vehicleYear = value!,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Campo Ano do Veiculo é obrigatório";
                                  }
                                  return null;
                                },
                                controller: _controllerVehicleYear,
                                maxLength: 4,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  filled: true,
                                  icon: const Icon(Icons.fire_truck_sharp),
                                  hintText: "2012",
                                  labelText: "Ano do Veiculo",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                              child: TextFormField(
                                onSaved: (value) => typeFuel = value!,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Campo Tipo de Combustivel é obrigatório";
                                  }
                                  return null;
                                },
                                controller: _controllerTypeFuel,
                                maxLength: 10,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  filled: true,
                                  icon: const Icon(Icons.local_gas_station),
                                  hintText: "Diesel",
                                  labelText: "Tipo de Combustivel",
                                ),
                              ),
                            ),
                            CustomDropdownRegister(
                              labelText: "Selecione a Situação do Veiculo",
                              hintText: "Selecione a Situação do Veiculo",
                              value: dropdownCondition,
                              onChanged: (Object? Condition) {
                                setState(() {
                                  dropdownCondition = Condition!.toString();
                                });
                                throw "";
                              },
                              items: Condition.map((String Condition) {
                                return DropdownMenuItem(
                                  value: Condition,
                                  child: Text(Condition),
                                );
                              }).toList(),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    save(context);
                                  },
                                  child: Text("Cadastrar"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}

final ConditionSelected = TextEditingController();
List<String> Condition = [
  "Operacional",
  "Desativado",
];
