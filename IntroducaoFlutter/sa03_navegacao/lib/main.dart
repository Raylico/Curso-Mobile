import 'package:flutter/material.dart';
import 'package:sa03_navegacao/views/Tela_Boasvindas.dart';
import 'package:sa03_navegacao/views/Tela_cadastro.dart';
import 'package:sa03_navegacao/views/tela_confirmacao.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      // nome_da_rota => Tela()
      "/": (context) => TelaBoasVindas(),
      "/cadastro": (context) => TelaCadastro(),
      "/confirmacao": (context) => TelaConfirmacao(),
    },
  ));
}