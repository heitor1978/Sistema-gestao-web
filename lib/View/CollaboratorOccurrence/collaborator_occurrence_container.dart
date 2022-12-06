import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class CollaboratorOccurrenceContainer extends StatelessWidget {
  CollaboratorOccurrenceContainer({super.key, this.uid});

  final String? uid;
  final firestore = FirebaseFirestore.instance;

  getAllOccurrence() {
    return firestore
        .collection('funcionarios')
        .doc(uid)
        .collection('ocorrencia')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: getAllOccurrence(),
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
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color.fromARGB(255, 240, 240, 240),
                          ),
                          child: Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  /*child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 17,
                                  ),*/
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Table(
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    children: [
                                      TableRow(children: [
                                        Text(
                                          snapshot.data!.docs[index]
                                              ['nomeOcorrencia'],
                                          style: GoogleFonts.poppins(
                                            fontSize: 17,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              90, 0, 0, 0),
                                          child: Text(
                                            snapshot.data!.docs[index]
                                                ['registroOcorrencia'],
                                            style: GoogleFonts.poppins(
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              210, 0, 0, 0),
                                          child: Text(
                                            snapshot.data!.docs[index]
                                                ['datahora'],
                                            style: GoogleFonts.poppins(
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                      ])
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
