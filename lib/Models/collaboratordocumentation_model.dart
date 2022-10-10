class CollaboratorDocumentationModel{
  String? name;
  String? file;
  String? uid;

  CollaboratorDocumentationModel({
    required this.name,
    required this.file,
    required this.uid,
  });

  CollaboratorDocumentationModel.fromMap(Map<String, dynamic> map){
    name = map['nome'];
    file = map['arquivo'];
    uid = map['uid'];
  }
}