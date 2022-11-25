import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleActiveContainer extends StatelessWidget {
  VehicleActiveContainer({super.key, this.uid});
  final String? uid;
  final firestore = FirebaseFirestore.instance;
  var docs;

  void save(
      String anoVeiculo,
      String marca,
      String placa,
      String tipoCombustivel,
      String versaoVeiculo,
      String uid,
      String uidVehicle) async {
    firestore
        .collection('funcionarios')
        .doc(uid)
        .collection('veiculo')
        .doc(uid)
        .set({
      "anoVeiculo": anoVeiculo,
      "marca": marca,
      "placa": placa,
      "tipoCombustivel": tipoCombustivel,
      "uid": uidVehicle,
      "versaoVeiculo": versaoVeiculo,
    });
  }

  getAllVehicle() {
    return firestore
        .collection('veiculos')
        .where('veiculoAtivo', isEqualTo: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: sort_child_properties_last
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: getAllVehicle(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) return const CircularProgressIndicator();
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (_, index) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      return InkWell(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            /*decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color.fromARGB(255, 240, 240, 240),
                            ),*/
                            child: Container(
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 17,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Row(
                                      // mainAxisAlignment:
                                         // MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          snapshot.data!.docs[index]['versaoVeiculo'],
                                          style: GoogleFonts.poppins(
                                            fontSize: 17,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              430, 0, 0, 0),
                                          child: Text(
                                            snapshot.data!.docs[index]['marca'],
                                            style: GoogleFonts.poppins(
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            save(
                                snapshot.data!.docs[index].get('anoVeiculo'),
                                snapshot.data!.docs[index].get('marca'),
                                snapshot.data!.docs[index].get('placa'),
                                snapshot.data!.docs[index]
                                    .get('tipoCombustivel'),
                                snapshot.data!.docs[index].get('versaoVeiculo'),
                                uid!,
                                snapshot.data!.docs[index].get('uid'));
                          }); 
                    });
              },
            ),
          ),
        ],
      ),
      color: const Color.fromARGB(255, 240, 240, 240),
    );
  }
}
