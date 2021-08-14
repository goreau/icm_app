import 'package:flutter/material.dart';
import 'package:icm_app/util/comunica.dart';
import 'package:icm_app/util/comunica.dart';

class ComImporta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Importar Cadastro'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
              onPressed: () {
                Comunica com = Comunica();
                /*com.fetchDados(context).then(
                      (String value) => _handleRetornoRecebe(value),
                    );*/
              },
              child: Text('Carregar'),
              style: ElevatedButton.styleFrom(primary: Colors.blue)),
        ),
      ),
    );
  }
}
