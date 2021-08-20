import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm_app/controllers/consulta.controller.dart';
import 'package:icm_app/models/visita.dart';
import 'package:icm_app/views/consulta/consulta-tile.dart';
import '../../colors-constants.dart';


class Consulta extends StatelessWidget {
  final ConsultaController _c = Get.put(ConsultaController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        title: Text('Propostas realizadas'),
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.EMP_TIMELINE, arguments: 0);
            },
            child: Icon(FontAwesomeIcons.plus),
          )
        ],
      ),*/
      body: Container(
        child: Obx(
          () {
            return _c.loaded.value
                ? ListaEmprestimo(_c.itens)
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

class ListaEmprestimo extends StatelessWidget {
  final List<LstVisita> lista;
  ListaEmprestimo(this.lista);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (ctx, i) => ConsultaTile(lista[i]),
      ),
    );
  }
}
