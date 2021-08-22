import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm_app/controllers/consulta.controller.dart';
import 'package:icm_app/models/visita.dart';
import 'package:icm_app/util/routes.dart';
import 'package:icm_app/views/consulta/consulta-master.dart';
import 'package:icm_app/views/consulta/consulta-tile.dart';
import '../../colors-constants.dart';

class Consulta extends StatelessWidget {
  final ConsultaController ctrl = Get.put(ConsultaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visitas realizadas'),
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.VISITA, arguments: 0);
            },
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        child: Obx(
          () {
            return ctrl.loaded.value
                ? ListaVisitas(ctrl.itens)
                : Text(
                    'Carregando...',
                    style: TextStyle(color: COR_SECUNDARIA),
                  );
          },
        ),
      ),
    );
  }
}

class ListaVisitas extends StatelessWidget {
  final List<LstMaster> lista;
  ListaVisitas(this.lista);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (ctx, i) => ConsultaMaster(lista[i]),
      ),
    );
  }
}
