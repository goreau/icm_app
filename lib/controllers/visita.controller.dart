import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm_app/models/visita.dart';
import 'package:icm_app/util/auxiliar.dart';
import 'package:icm_app/util/routes.dart';

class VisitaController extends GetxController {
  var lstArea = <DropdownMenuItem<String>>[].obs;
  var lstCens = <DropdownMenuItem<String>>[].obs;
  var lstQuart = <DropdownMenuItem<String>>[].obs;
  var idArea = '0'.obs;
  var idCens = '0'.obs;
  var idQuart = '0'.obs;
  var loadingArea = false.obs;
  var loadingCens = false.obs;
  var loadingQuart = false.obs;
  var dateController = TextEditingController().obs;
  var dtCadastro = DateTime.now().toString().substring(0, 10).obs;

  final agenteController = TextEditingController();

  var visita = new Visita().obs;

  doRegister() async {
    this.visita.value.agente = this.agenteController.text;
    this.visita.value.dtCadastro = dateController.value.text;

    Get.toNamed(Routes.VISITA);
  }

  getCurrentDate(String date) async {
    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    this.dateController.value.text = formattedDate;
    this.dtCadastro.value = formattedDate.toString();
  }

  loadArea() {
    this.loadingArea.value = true;
    Auxiliar.loadData('area', ' id_municipio=220 ').then((value) {
      this.lstArea.value = value;
      this.loadingArea.value = false;
    });
  }

  updateArea(value) {
    this.loadingCens.value = true;
    this.visita.value.idArea = value;
    Auxiliar.loadData('censitario', ' id_area= ' + value).then((value) {
      this.lstCens.value = value;
      this.loadingCens.value = false;
    });
  }

  updateCens(value) {
    this.visita.value.idCensitario = value;
    this.loadingQuart.value = true;
    Auxiliar.loadData('quarteirao', ' id_censitario= ' + value).then((value) {
      this.lstQuart.value = value;
      this.loadingQuart.value = false;
    });
  }

  updateQuart(value) {
    this.visita.value.idQuarteirao = value;
  }
}
