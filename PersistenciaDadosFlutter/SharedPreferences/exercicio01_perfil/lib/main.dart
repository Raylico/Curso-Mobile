import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MaterialApp(
    home: TelaPerfil(),
    // routes: {

    // },
    // theme: ,
    // darkTheme: ,
    debugShowCheckedModeBanner: false,
  ));
}

class TelaPerfil extends StatefulWidget {
  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  //atributos
  TextEditingController _nomeController = TextEditingController(); //receber os dados do input
  TextEditingController _idadeController = TextEditingController();

  String? _nome; //"?" permite que tenham variaveis nulas
  String? _idade; //"?" permite que tenham variaveis nulas
  String? _corSelecionada;

  String? _cor; 

  Map<String,Color> coresDisponiveis ={ //"map" vetor ordenado por chave 
    "Azul": Colors.blue,
    "Verde": Colors.green,
    "Vermelho": Colors.red,
    "Amarelo": Colors.yellow,
    "Roxo": Colors.grey,
    "Preto": Colors.black,
    "Branco": Colors.white,
  };

  //criar a cor de fundo
  Color _corFundo = Colors.white;
  //metodos
  @override
  void initState() { //método para carregar antes de buildar a tela 
    super.initState();
    _carregarPreferencias();
  }
  
  _carregarPreferencias() async{ //método assincrono (executa - sem ordem de execução)
  //conectar com o shared preferences
    SharedPreferences _prefs = await SharedPreferences.getInstance(); //busca todas as informações
    setState(() {
      _nome = _prefs.getString("nome"); //busca o nome
      _idade = _prefs.getString("idade"); //busca a idade
      _cor = _prefs.getString("cor");     
      if(_cor != null){
        _corFundo = coresDisponiveis[_cor!]!; //"!" permite nulo
        _corSelecionada = _cor;
      }
    });
  }

  _salvarPreferencias() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _nome = _nomeController.text.trim();
    _idade = _idadeController.text.trim();
    _corFundo = coresDisponiveis[_cor!]!;

    await _prefs.setString("nome", _nomeController.text.trim());//armazena o nome 
    await _prefs.setString("idade", _idadeController.text.trim());// armazena a idade com o double
    await _prefs.setString("cor", _cor ?? "Branco"); // armazena a cor, caso nulo ele irá armazenar branco
    setState(() {
      
    });
  }
  //build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _corFundo,
      appBar: AppBar(title: Text("Meu Perfil Persistente"), backgroundColor: Colors.purple,),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: "Nome"),
            ),
            TextField(
              controller: _idadeController,
              decoration: InputDecoration(labelText: "Idade"),
              keyboardType: TextInputType.numberWithOptions(),
            ),
            SizedBox(height: 16,),
            DropdownButtonFormField(
              value: _cor,
              decoration: InputDecoration(labelText: "Cor Favorita"),
              items: coresDisponiveis.keys.map(
                (cor){
                  return DropdownMenuItem(
                    value: cor,
                    child: Text(cor));
                 }
                ).toList(),
                onChanged: (valor){
                  setState(() {
                    _cor = valor;
                  });
                }),
              SizedBox(height: 16,),
              ElevatedButton(
                onPressed: _salvarPreferencias, child: Text("Salvar")),
              SizedBox(height: 16,),
              Divider(),
              SizedBox(height: 16,),
              Text("Dados Salvos:"),
              if(_nome != null)
                Text("Nome: $_nome"),
              if(_idade != null)
                Text("Idade: $_idade  "),
              if(_cor != null)
                Text("Cor favorita: $_cor"),
            ],
          ),
        ),
      );
    }
  }




