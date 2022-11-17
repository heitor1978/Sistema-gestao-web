import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestao_web/View/AdministrationCollaborators/administration_collaborator.dart';
import 'package:google_fonts/google_fonts.dart';

class CollaboratorActive extends StatelessWidget {
  final firestore = FirebaseFirestore.instance;

  getAllCollaborator() {
    return firestore
        .collection('funcionarios')
        .where('admin', isEqualTo: false)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Color.fromARGB(255, 240, 240, 240),
      ),
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: getAllCollaborator(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return const CircularProgressIndicator();
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color.fromARGB(255, 240, 240, 240),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 17,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  snapshot.data!.docs[index]['nome'],
                                  style: GoogleFonts.poppins(
                                    fontSize: 17,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Text(
                                    snapshot.data!.docs[index]['telefone'],
                                    style: GoogleFonts.poppins(
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Text(
                                    snapshot.data!.docs[index]['cpf'],
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
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (_) => AdministrationCollaborator(
                                  uid: snapshot.data!.docs[index].get('uid'))),
                          (route) => false);
                    },
                  );
                });
          }),
    );
  }
}
