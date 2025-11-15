import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:myapp/veiculo.dart';
import 'package:mysql_client/mysql_client.dart';

class VeiculoRepository {
  Future<MySQLConnection> conectarMySql() async {
    var connection = await MySQLConnection.createConnection(
      host: "sql10.freesqldatabase.com",
      port: 3306,
      userName: "sql10807828",
      password: "2Kl5vIJERW",
      secure: false,
    );

    return connection;
  }

  Future<List<Veiculo>> listarVeiculos() async {
    List<Veiculo> veiculos = [];
    log("passou por aqui!");

    try {
      var connection = await conectarMySql();
      await connection.connect();

      var result = await connection.execute("SELECT * FROM veiculos");

      result.rows.forEach((row) {
        veiculos.add(
          Veiculo(
            marca: row.colByName("marca"),
            modelo: row.colByName("modelo"),
            ano: int.parse(row.colByName("ano")!),
          ),
        );
      });

      connection.close();
    } catch (e) {
      debugPrint("Erro ao conectar ao banco de dados: $e");
    }
    return veiculos;
  }
}
