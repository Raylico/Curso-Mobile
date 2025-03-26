import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        actions: [
          IconButton(onPressed: () => print("Notificação"), icon: Icon(Icons.notifications)),
          IconButton(onPressed: () => print("Notificação"), icon: Icon(Icons.home)),
      ],
    ),
    body: Center(
      child: Column(
        children: [
          Image.network("https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
            width: 200, height: 200, fit: BoxFit.cover,),
              Text("Nome de Perfil", style: TextStyle(fontSize: 30, color: Colors.blue),),
              Text("Informações pessoais", style: TextStyle(fontSize: 20, color: Colors.black),),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 150, height: 150, color: Colors.blue),
                  Container(width: 150, height: 150, color: Colors.green),
                  Container(width: 150, height: 150, color: Colors.red)
                ],
              )
          ],
        ),
      ),
    );
  }
}








