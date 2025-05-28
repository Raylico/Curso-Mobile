//classe de apoio a conexões do banco de dados 

import 'package:path/path.dart';
import 'package:sa_petshop/models/pet_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

//classe Singleton -> de objeto único
class DbHelper{
  static Database? _database; //obj para criar as conexões com o banco de dados
  //transformar a classe em singleton
  //não permite instanciar outro objeto enquanto um obj estiver ativo
  static final DbHelper _instance = DbHelper._internal();
  //construtor para o singleton
  DbHelper._internal();
  factory DbHelper() => _instance;

  //fazer as conexões com o banco de dados
  Future<Database> get database async{
    if (_database != null){
      return _database!;
    }else{
      _database =await _initDatabase();
      return _database!;
    }
  }

  Future<Database> _initDatabase() async{
    //pegar o caminho do banco de dados
    final dbPath = await getDatabasesPath();
    final path = join (dbPath,"petshop.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreateDB
    );
  }
  Future<void> _onCreateDB(Database db, int versio) async{
    //Criar tabela dos pets
    await db.execute(
      """CREATE TABLE IF EXISTS pets(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL,
      raca TEXT NOT NULL,
      nome_dono TEXT NOT NULL,
      telefone TEXT NOT NULL,
      )"""
    );
    print("tabela pet criada");
    //Criar a tabela das colsultas
    await db.execute(
      """CREATE TABLE IF NOT EXISTS consultas(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      pet_id INTEGER NOT NULL,
      data_hora TEXT NOT NULL,
      tipo_servico TEXT NOT NULL,
      observacao TEXT,
      FOREIGN KEY (pet_id) REFERENCES pets(id) ON DELETE CASCADE
      )"""
    );
    print("tabela consulta criada");
  }

  //métodos CRUD para pets
  Future<int> insertPet(Pet pet) async {
    final db = await database;
    return await db.insert("pets", pet.toMap());//retorna o id do pet
  }

  Future<List<Pet>> getPets() async {
    final db = await database;
    final List<Map<String,dynamic>> maps = await db.query("pets"); //receber as info do banco de dados
    //converter os valores para objetos
    return maps.map((e) =>Pet.fromMap(e)).toList();
  }

  Future<Pet?> getPetbyId(int id) async{
    final db = await database;
    final List<Map<String,dynamic>> maps = await db.query("pets", where: "id=?", whereArgs: [id]);
    //se encontrado
    if(maps.isNotEmpty){
      return Pet.fromMap(maps.first); //cria o obj com 1º elemento da lista
    }else{
      return null; //não encontrado
    }
  }
  
  Future<int> deletePet(int id) async {
    final db = await database;
    return await db.delete("pets", where: "id=?",whereArgs: [id]);
    //deleta o pet da tabela que tenha o id igual o enviado como parâmetro
  }
  //métodos crud para consultas
  
}