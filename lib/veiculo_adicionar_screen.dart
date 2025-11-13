import 'package:flutter/material.dart';
import 'package:myapp/veiculo.dart';

class VeiculoAdicionarScreen extends StatelessWidget {
  VeiculoAdicionarScreen({super.key});

  TextEditingController marcaController = TextEditingController();
  TextEditingController modeloController = TextEditingController();
  TextEditingController anoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Adicione veículo",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          TextField(
            controller: marcaController,
            decoration: InputDecoration(
              labelText: "Marca",
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: modeloController,
            decoration: InputDecoration(
              labelText: "Modelo",
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: anoController,
            decoration: InputDecoration(
              labelText: "Ano",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: FloatingActionButton(
              onPressed: () {
                Veiculo veiculo = Veiculo(
                  marca: marcaController.text,
                  modelo: modeloController.text,
                  ano: int.parse(anoController.text),
                );

                Navigator.pop(context, veiculo);
              },
              child: Text("Incluir"),
              heroTag: "veiculo.incluir",
            ),
          ),
        ],
      ),
    );
  }
}
