import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm_app/models/visita.dart';
import 'package:icm_app/util/db_helper.dart';
import 'package:icm_app/views/consulta/consulta-tile.dart';

class ConsultaController extends GetxController {
  var loaded = false.obs;
  List<LstMaster> itens = [];
  List<LstDetail> dets = [];
  ConsultaController() {
    inicio();
  }

  Future<void> inicio() async {
    await loadItens();
  }

  Future<void> loadItens() async {
    try {
      final db = DbHelper.instance;
      //List<LstVisita> json = await db.consultaVisitas();
      itens = await db.consultaVisitasMaster();
      //var tagObjsJson = json['lista'] as List;
      //itens = json.map((tagJson) => LstVisita.fromJson(tagJson)).toList();
      loaded.value = true;
    } catch (ex) {
      print('Erro criando lista' + ex.toString());
    }
  }

  Future<List<LstDetail>> loadDetails(id) async {
    List<LstDetail> dt = [];
    try {
      final db = DbHelper.instance;
      dt = await db.consultaVisitasDetail(id);
    } catch (ex) {
      print('Erro criando lista' + ex.toString());
    }

    return dt;
  }

  excluiVisita(vis) {
    final db = DbHelper.instance;
    db.delete(vis, 'visita');
  }

  List<Widget> getDetail(int id) {
    List<Widget> childs = [];
    loadDetails(id).then((value) {
      value.forEach((element) {
        childs.add(ConsultaTile(element));
      });
      return childs;
    });
    return childs;
  }
}
