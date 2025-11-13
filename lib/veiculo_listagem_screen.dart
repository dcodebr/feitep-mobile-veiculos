import 'package:flutter/material.dart';
import 'package:myapp/veiculo.dart';
import 'package:myapp/veiculo_adicionar_screen.dart';

class VeiculoListagemScreen extends StatefulWidget {
  const VeiculoListagemScreen({super.key});

  @override
  State<VeiculoListagemScreen> createState() => _VeiculoListagemScreenState();
}

class _VeiculoListagemScreenState extends State<VeiculoListagemScreen> {
  List<Veiculo> veiculos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Lista de Veículos", style: TextStyle(fontSize: 30)),
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "veiculo.add",
            onPressed: () async {
              Veiculo resultado = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VeiculoAdicionarScreen(),
                ),
              );

              if (resultado != null) {
                setState(() {
                  veiculos.add(resultado);
                });
              }
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: veiculos
              .map<Widget>((veiculo) => construirItemVeiculo(veiculo))
              .toList(),
        ),
      ),
    );
  }

  Widget construirItemVeiculo(Veiculo veiculo) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(children: [Text("Modelo:"), Text(veiculo.modelo!)]),
    );
  }
}
