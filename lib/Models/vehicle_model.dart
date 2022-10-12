class VehicleModel{
  bool? veiculoAtivo;
  String? placa;
  String? anoVeiculo;
  String? versaoVeiculo;
  String? marca;
  String? tipoCombustivel;
  String? imagem;
  String? uid;


  VehicleModel({
    required this.veiculoAtivo,
    required this.placa,
    required this.anoVeiculo,
    required this.versaoVeiculo,
    required this.marca,
    required this.tipoCombustivel,
    required this.imagem,
    required this.uid,
  });

  VehicleModel.fromMap(Map<String, dynamic> map){
    veiculoAtivo = map['veiculoAtivo'];
    placa = map['placa'];
    anoVeiculo = map['anoModelo'];
    versaoVeiculo = map['versaoVeiculo'];
    marca = map['marca'];
    tipoCombustivel = map['tipoCombustivel'];
    imagem = map['imagem'];
    uid = map['uid'];
  }

}