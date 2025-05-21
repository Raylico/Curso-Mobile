class Nota{
  //atributos = colunasBD
  final int? id; 
  final String titulo;
  final String conteudo;

  //construtor
  Nota({this.id, required this.titulo, required this.conteudo});

  //métodos

  //converter o objeto <=> BD

  //sempre que for ter banco de dados
  //toMap Objeto -> BD
  Map<String, dynamic> toMap(){
    return {
      "id":id, //o id, inicialmente pode ser nulo
      "titulo":titulo,
      "conteudo":conteudo,
    };
  }
  //fromMap BD -> Objeto
  factory Nota.fromMap(Map<String, dynamic> map){
    return Nota(
      id: map["id"] as int, //converte para int (usando cast)
      titulo: map["titulo"] as String,
      conteudo: map["conteudo"] as String);
  }
}










