class CollaboratorModel{
  bool? admin;
  String? cpf;
  String? nome;
  String? telefone;
  String? uid;

  CollaboratorModel({
    required this.admin,
    required this.cpf,
    required this.nome,
    required this.telefone,
    required this.uid,
  });


  CollaboratorModel.fromMap(Map<String, dynamic> map){
    admin = map['admin'];
    cpf = map['cpf'];
    nome = map['nome'];
    telefone = map['telefone'];
    uid = map['uid'];
  }
}