import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gestao_web/Theme/theme.dart';
import 'package:gestao_web/View/CollaboratorRegistration/collaborator_registration.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gestao_web/Widgets/export_all_widget.dart';
import 'package:gestao_web/View/export_all_view.dart';

class AdministrationCollaborator extends StatefulWidget {
  final String uid;
  const AdministrationCollaborator({Key? key, required this.uid})
      : super(key: key);

  @override
  State<AdministrationCollaborator> createState() =>
      _AdministrationCollaboratorState();
}

class _AdministrationCollaboratorState
    extends State<AdministrationCollaborator> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 224, 227, 231),
        drawer: CustomDrawer(),
        appBar: CustomAppBarHome(
          title: "Administração dos Funcionarios",
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
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(250, 15, 250, 15),
                      child: Container(
                        decoration: BoxDecoration(
                            color: colorCard,
                            borderRadius: BorderRadius.circular(15)),
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(23, 10, 23, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      //"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-HmqnmKL4-cOvhmeevf2UbJwyKdJW5uUztg&usqp=CAU",
                                      "assets/images/CaminhaoMercedes.jpg",
                                      height: 50,
                                      width: 50,
                                    ),
                                    Column(
                                      children: [Text("Veiculo do Motorista")],
                                    ),
                                    Icon(
                                      Icons.check_circle_outline_rounded,
                                      color: Color.fromARGB(255, 55, 206, 58),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            VehicleActiveView(uid: widget.uid),
                                      ));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          18, 0, 18, 0),
                                      child: Text(
                                        "Adicionar / Alterar Veiculo",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll<Color>(
                                              primaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(250, 15, 250, 15),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CollaboratorRoutes(uid: widget.uid),
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: colorCard,
                              borderRadius: BorderRadius.circular(15)),
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/localization.png",
                                  height: 50,
                                  width: 50,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Cadastro de Rotas",
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    /*Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            CollaboratorDocumentation(uid: widget.uid),
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: colorCard,
                          borderRadius: BorderRadius.circular(15)),
                      margin: EdgeInsets.fromLTRB(500, 0, 500, 0),
                      height: 100,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/pdf-file.png",
                                  width: 50,
                                  height: 50,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                    "Documentações",
                                    style: GoogleFonts.poppins(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),*/
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    CollaboratorChecklistView(uid: widget.uid),
                              ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: colorCard,
                                  borderRadius: BorderRadius.circular(15)),
                              margin: EdgeInsets.fromLTRB(250, 15, 250, 15),
                              height: 100,
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "assets/images/check-box.png",
                                          width: 50,
                                          height: 50,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 0, 0, 0),
                                          child: Text(
                                            "Checkagem do Motorista",
                                            style: GoogleFonts.poppins(),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(250, 0, 250, 15),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CollaboratorOccurrence(uid: widget.uid),
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: colorCard,
                              borderRadius: BorderRadius.circular(15)),
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/localization.png",
                                  height: 50,
                                  width: 50,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Ocorrências do Motorista",
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]));
  }
}
