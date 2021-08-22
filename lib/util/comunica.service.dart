import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'db_helper.dart';

class ComunicaService {
  final dbHelper = DbHelper.instance;

  List<String> entidades = [
    "area",
    "censitario",
    "quarteirao",
  ];

  Future<List<dynamic>> postVisitas(BuildContext context, String dados) async {
    String _url = '';
    String resumo = 'Registros enviados:\n';
    //print(dados);
    _url = 'http://200.144.1.24/icm_api/exporta.php';
    var values = {'dados': dados};
    final response = await http.post(Uri.parse(_url), body: values);
    var data = [];
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
    } else {
      throw Exception('Falha ao carregar cadastro');
    }
    return data;
  }

  Future<String> getCadastro(BuildContext context) async {
    String _url = '';
    String resumo = 'Registros recebidos:\n';

    _url = 'http://200.144.1.24/icm_api/importa.php?tipo=cadastros';

    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final dados = data['dados'];

      for (var linha in entidades) {
        final obj = dados[linha];
        if (obj == null) {
          continue;
        }
        await dbHelper.limpa(linha);
        Map<String, dynamic> row = new Map();
        int ct = 0;
        if (linha == 'area') {
          ct = 0;
          for (var campo in obj) {
            row['id_area'] = campo['id_area'];
            row['id_municipio'] = campo['id_municipio'];
            row['codigo'] = campo['codigo'].toString().trim();
            await dbHelper.insert(row, linha);
            ct++;
            //print('$ct areas');
          }
          resumo += ct > 0 ? 'Área: $ct registros\n' : '';
        } else if (linha == 'censitario') {
          ct = 0;
          for (var campo in obj) {
            row['id_censitario'] = campo['id_censitario'];
            row['id_area'] = campo['id_area'];
            row['codigo'] = campo['codigo'].toString().trim();
            await dbHelper.insert(row, linha);
            ct++;
          }
          resumo += ct > 0 ? 'Censitário: $ct registros\n' : '';
        } else if (linha == 'quarteirao') {
          ct = 0;
          for (var campo in obj) {
            row['id_quarteirao'] = campo['id_quarteirao'];
            row['id_censitario'] = campo['id_censitario'];
            row['numero'] = campo['numero_quarteirao'].toString().trim();
            row['sub_numero'] = campo['sub_numero'].toString().trim();
            await dbHelper.insert(row, linha);
            ct++;
          }
          resumo += ct > 0 ? 'Quarteirão: $ct registros\n' : '';
        }
      }
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: const Text('Cadastro recebido.'),
          backgroundColor: Colors.green[900],
        ),
      );
    } else {
      throw Exception('Falha ao carregar cadastro');
    }
    return resumo;
  }
}
