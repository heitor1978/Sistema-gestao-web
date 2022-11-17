import 'package:flutter/material.dart';
import 'package:gestao_web/View/AdministrationCollaborators/administration_collaborator.dart';
import 'package:gestao_web/View/ScreenStart/screen_start.dart';
import 'package:gestao_web/View/CollaboratorRegistration/collaborator_registration.dart';
import 'package:gestao_web/View/VehicleRegistration/vehicle_registration.dart';
import 'package:gestao_web/View/export_all_view.dart';

import 'Home/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //home: Login(),
      home: ScreenStart(),
      //home: Home(),
      //home: CollaboratorRegistration(),
      //home: VehicleRegistration(),
      debugShowCheckedModeBanner: false,
    );
  }
}
