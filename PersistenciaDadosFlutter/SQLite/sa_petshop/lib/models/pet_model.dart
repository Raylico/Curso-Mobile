class Pet {
  //atributos ->
  //toda variável do tipo "final" pode se muda apenas uma ÚNICA vez
  final int? id;
  final String nome;
  final String raca;
  final String nomeDono;
  final String telefone;

//métodos -> contrutor
Pet({
    this.id,
    required this.nome,
    required this.raca,
    required this.nomeDono,
    required this.telefone,
  });

  //Métodos de Conversão de OBJ <=> BD 
  //toMap: obj => BD 
  Map<String,dynamic> toMap() {
    return {
      "id": id,
      "nome": nome, 
      "raca": raca,
      "nome_dono": nomeDono, //coluna de banco de dados não aceita letra minúscula
      "telefone": telefone,
    };
  }
  //fromMAp: BD => obj
  factory Pet.fromMap(Map<String,dynamic> map){
    return new Pet (
      id: map["id"] as int, //cast, transforma 
      nome: map ["nome"] as String,
      raca: map["raca"] as String,
      nomeDono: map["nome_dono"] as String,
      telefone: map["telefone"]as String);
  }
}




