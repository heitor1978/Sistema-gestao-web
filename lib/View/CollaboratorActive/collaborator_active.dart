import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestao_web/Widgets/export_all_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'dart:async';
import 'package:gestao_web/View/export_all_view.dart';
import 'package:gestao_web/View/Administration Collaborators/administration_collaborator.dart';

class CollaboratorActive extends StatelessWidget {
  final firestore = FirebaseFirestore.instance;


 getAllCollaborator(){
    return firestore.collection('funcionarios').where('admin', isEqualTo: false).snapshots();
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
              stream: getAllCollaborator(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (_, index) {
                    if(snapshot.hasError){
                      return Text('Error: ${snapshot.error}');
                    }
                        return InkWell(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(500, 15, 500, 10),
                            width: MediaQuery.of(context).size.width,
                            height: 70,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(25, 10, 10, 10),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              color: Color.fromARGB(255, 240, 240, 240),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data!.docs[index].get('nome'),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.yellow,
                                        height: 2,
                                        endIndent: 0,
                                        indent: 20,
                                        thickness: 5,
                                      ),
                                      Text(snapshot.data!.docs[index].get('uid')),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (_) => AdministrationCollaborator(uid: snapshot.data!.docs[index].get('uid'))), (route) => false);
                          },
                        );
                    }
                );
              },
            ),
          ),
        ],
      ),
      color: const Color.fromARGB(255, 240, 240, 240),
    );
  }
}
