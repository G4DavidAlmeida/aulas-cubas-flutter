import 'package:flutter/material.dart';
import 'package:passagem_onibus/Database/connect.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class Passageiro {
  String nome;
  String cpf;
  int idade;
  double valorPassagem;
  Database _connect;

  Passageiro(this.nome, this.cpf, this.idade);

  Future<int> count() async {
    var query = await _connect.rawQuery('SELECT COUNT(*) FROM passageiro');
    return Sqflite.firstIntValue(query);
  }

  Future<void> save() async {
    this._connect = await Connect.dataBaseManager();
    int numeroPassageiros = await this.count();

    if (numeroPassageiros >= 5) {
      AlertDialog(
        title: Text('Numero máximo de passageiros atingidos'),
      );
      return;
    }

    if (this.idade >= 18) {
      int porcentagem = (40 * 0.7).ceil();
      this.valorPassagem = numeroPassageiros <= porcentagem ? 10 : 15;
    } else {
      this.valorPassagem = 0;
    }

    Map<String, dynamic> dadosTask = {
      "nome": this.nome,
      "cpf": this.cpf,
      "idade": this.idade,
      "valor": this.valorPassagem
    };

    await _connect.insert("passageiro", dadosTask);
    print('passageiro ${this.nome} salvo');
  }

  static List<Passageiro> convertList(query) {
    List<Passageiro> list = [];
    for (var item in query) {
      var passageiro = new Passageiro(item['nome'], item['cpf'], item['idade']);
      passageiro.valorPassagem = double.parse(item['valor'].toString());
      list.add(passageiro);
    }
    return list;
  }

  static Future<List<Passageiro>> list() async {
    Database connect = await Connect.dataBaseManager();

    var query = await connect.query('passageiro');
    return Passageiro.convertList(query.toList());
  }

  Future<void> remove() async {
    this._connect = await Connect.dataBaseManager();

    await _connect
        .delete('passageiro', where: 'cpf = ?', whereArgs: [this.cpf]);
  }
}
