import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class CollaboratorOccurrenceContainer extends StatelessWidget {
  CollaboratorOccurrenceContainer({super.key, this.uid});

  final String? uid;
  final firestore = FirebaseFirestore.instance;

  getAllOccurrence(){
    return firestore.collection('funcionarios').doc(uid).collection('ocorrencia').snapshots();
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
                if(!snapshot.hasData) return const CircularProgressIndicator();
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
                                        snapshot.data!.docs[index].get('nomeOcorrencia'),
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
                                      Text(snapshot.data!.docs[index].get('registroOcorrencia')),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                    
                          },
                        );
                    }
                );
              },
            ),
          ),
        ],
      ) ,
    );
  }
}

