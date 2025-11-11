import 'package:flutter/material.dart';
import 'package:myapp/veiculo.dart';

class VeiculoListagemScreen extends StatefulWidget {
  const VeiculoListagemScreen({super.key});

  @override
  State<VeiculoListagemScreen> createState() => _VeiculoListagemScreenState();
}

class _VeiculoListagemScreenState extends State<VeiculoListagemScreen> {
  List<Veiculo> veiculos = [
    Veiculo(marca: "Toyota", modelo: "Corolla", ano: 2022),
    Veiculo(marca: "Honda", modelo: "Civic", ano: 2022),
    Veiculo(marca: "Subaru", modelo: "Impreza", ano: 2021),
    Veiculo(marca: "Ford", modelo: "Focus", ano: 2022),
    Veiculo(marca: "Chevrolet", modelo: "Camaro", ano: 2021),
    Veiculo(marca: "Nissan", modelo: "Sentra", ano: 2022),
    Veiculo(marca: "Hyundai", modelo: "Elantra", ano: 2021),
    Veiculo(marca: "Kia", modelo: "Sportage", ano: 2022),
    Veiculo(marca: "1Mazda", modelo: "CX-5", ano: 2021),
    Veiculo(marca: "Volkswagen", modelo: "Golf", ano: 2022),
    Veiculo(marca: "1Toyota", modelo: "Corolla", ano: 2022),
    Veiculo(marca: "1Honda", modelo: "Civic", ano: 2022),
    Veiculo(marca: "1Subaru", modelo: "Impreza", ano: 2021),
    Veiculo(marca: "1Ford", modelo: "Focus", ano: 2022),
    Veiculo(marca: "1Chevrolet", modelo: "Camaro", ano: 2021),
    Veiculo(marca: "1Nissan", modelo: "Sentra", ano: 2022),
    Veiculo(marca: "1Hyundai", modelo: "Elantra", ano: 2021),
    Veiculo(marca: "1Kia", modelo: "Sportage", ano: 2022),
    Veiculo(marca: "1Mazda", modelo: "CX-5", ano: 2021),
    Veiculo(marca: "1Volkswagen", modelo: "Golf", ano: 2022),
  ];

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
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
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
