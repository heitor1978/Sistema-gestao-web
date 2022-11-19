import 'package:flutter/material.dart';
import 'package:gestao_web/View/VehicleActive/vehicle_active_container.dart';
import 'package:gestao_web/Theme/theme.dart';
import 'package:gestao_web/Widgets/export_all_widget.dart';


class VehicleActiveView extends StatefulWidget {
  final String? uid;
  const VehicleActiveView({super.key, this.uid});

  @override
  State<VehicleActiveView> createState() => _VehicleActiveViewState();
}

class _VehicleActiveViewState extends State<VehicleActiveView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  int indexNavigatorBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: const CustomAppBarHome(
        title: "Lista de Veiculos",
      ),
      body: PageView(
        onPageChanged: (int page) {
          setState(() {
            indexNavigatorBar = page;
          });
        },
        controller: _pageController,
        children: [
          VehicleActiveContainer(uid: widget.uid),
        ],
      ),
    );
  }
}