import 'package:flutter/material.dart';
import 'package:sa_petshop/controllers/pet_controller.dart';
import 'package:sa_petshop/models/pet_model.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
  }

class _HomeScreenState extends State<HomeScreen>{
  final PetController _petController = PetController();
  List<Pet> _pets = [];
  bool _isLoading = true; //enquanto carrega info do bd 

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  _carregarDados() async{
    setState(() {
      _isLoading = true; //inicia o carregamento
    });
    try{
      _pets = await _petController.readPets()
    } catch (e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Exception: $e")));
    }finally{ //execução obrigatória
      setState((){
        _isLoading = false;
      });
    }
  }

  //buildar a tela
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("PetShop - Clientes"),),
      body: _isLoading ? Center(child: CircularProgressIndicator(),) //enquanto estiver carregando as info do BD ,vai mostrar uma barra circular
      :Padding(padding: EdgeInsets.all(16),//espaçamento da parede do app
      child: ListView.builder( //construtor da lista
        itemCount: _pets.length,//tamanho da lista
        itemBuilder: (context, index) { //método de construção da lista
          final pet = _pets[index];
          return ListTile(
            title: Text("${pet.nome} - ${pet.raca}"),
            subtitle: Text("${pet.nomeDono} - ${pet.telefone}"),
            //on tap -> para navegar para o pet
            //onlongPress -> delete do Pet
        );//item da lista
              }),
            ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Adicionar Novo Pet",
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(
            builder: (context) => CadastroPetScreen()));
        },
      ),
    );
  }
}