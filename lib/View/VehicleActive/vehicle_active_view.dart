import 'package:flutter/material.dart';
import 'package:gestao_web/View/CollaboratorRegistration/collaborator_registration.dart';
import 'package:gestao_web/View/VehicleActive/vehicle_active_container.dart';
import 'package:gestao_web/Theme/theme.dart';
import 'package:gestao_web/Widgets/export_all_widget.dart';
import 'package:gestao_web/View/export_all_view.dart';


class VehicleActiveView extends StatefulWidget {
  final String? uid;
  const VehicleActiveView({super.key, this.uid});

  @override
  State<VehicleActiveView> createState() => _VehicleActiveViewState();
}

class _VehicleActiveViewState extends State<VehicleActiveView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        appBar: const CustomAppBarHome(
          title: "Lista de Veiculos",
        ),
        body: Row(children: <Widget>[
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
          Expanded(child: VehicleActiveContainer(uid: widget.uid)),
        ]));
  }
}
