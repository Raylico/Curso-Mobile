import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: GaleriaApp()));
}

class GaleriaApp extends StatefulWidget {
  @override
  _GaleriaAppState createState() => _GaleriaAppState();
}

class _GaleriaAppState extends State<GaleriaApp> {
  // Lista de URLs das imagens
  List<String> imagens = [
    "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0",
    "https://images.unsplash.com/photo-1521747116042-5a810fda9664",
    "https://images.unsplash.com/photo-1504384308090-c894fdcc538d",
  ];

  // Função para adicionar uma nova imagem à galeria
  void _adicionarImagem() {
    TextEditingController urlController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Adicionar Imagem"),
        content: TextField(
          controller: urlController,
          decoration: InputDecoration(hintText: "Digite a URL da imagem"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (urlController.text.isNotEmpty) {
                setState(() {
                  imagens.add(urlController.text); // Adiciona a nova imagem
                });
                Navigator.of(context).pop(); // Fecha o dialog
              }
            },
            child: Text("Adicionar"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Fecha o dialog
            child: Text("Cancelar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Galeria de Imagens"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // GridView para exibir as imagens em uma grade
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: imagens.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => _mostrarImagem(context, imagens[index]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(imagens[index], fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarImagem,
        child: Icon(Icons.add),
        tooltip: "Adicionar Imagem",
      ),
    );
  }

  // Função para mostrar a imagem em uma tela cheia
  void _mostrarImagem(BuildContext context, String imagem) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Image.network(imagem),
      ),
    );
  }
}
