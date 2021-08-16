import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm_app/controllers/importa.controller.dart';

class ComImporta extends StatelessWidget {
  final ImportaController ctrl = Get.put(ImportaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Importar Cadastro'),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    ctrl.loadCadastro(context);
                  },
                  child: Text('Carregar'),
                  style: ElevatedButton.styleFrom(primary: Colors.blue)),
            ),
          ),
          Obx(() {
            return ctrl.loaded.value == false
                ? Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [CircularProgressIndicator()]),
                  )
                : Text(ctrl.retorno.value);
          })
        ],
      ),
    );
  }
}
