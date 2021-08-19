import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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

  //var quintal = TextEditingController().obs;
  
  var fachada = 0.obs;
  var casa = 0.obs;
  var quintal = 0.obs;
  var sombraQuintal = 0.obs;
  var pavQuintal = 0.obs;
  var telhado = 0.obs;
  var recipiente = 0.obs;

  var lat = ''.obs;
  var lng = ''.obs;
  
  final agenteController = TextEditingController();
  final ordemController = TextEditingController();
  final endController = TextEditingController();
  final numeroController = TextEditingController();
  final latController = TextEditingController();
  final lngController = TextEditingController();

  var visita = new Visita().obs;
  

  Future<void> getPosition() async {
    Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //this.lat.value = pos.latitude.toString();
    //this.lng.value = pos.longitude.toString();
    this.latController.text = pos.latitude.toString();
    this.lngController.text = pos.longitude.toString();
  }

  alterFachada(val) {
    if (val == 'p'){
      this.fachada++;
    } else if (val == 'm'){
      this.fachada--;
    } 
  }

  alterCasa(val) {
    if (val == 'p'){
      this.casa++;
    } else if (val == 'm'){
      this.casa--;
    } 
  }

  alterQuintal(val) {
    if (val == 'p'){
      this.quintal++;
    } else if (val == 'm'){
      this.quintal--;
    } 
  }

  alterSombraQuintal(val) {
    if (val == 'p'){
      this.sombraQuintal++;
    } else if (val == 'm'){
      this.sombraQuintal--;
    } 
  }

  alterPavQuintal(val) {
    if (val == 'p'){
      this.pavQuintal++;
    } else if (val == 'm'){
      this.pavQuintal--;
    } 
  }

  alterTelhado(val) {
    if (val == 'p'){
      this.telhado++;
    } else if (val == 'm'){
      this.telhado--;
    } 
  }

  alterRecipiente(val) {
    if (val == 'p'){
      this.recipiente++;
    } else if (val == 'm'){
      this.recipiente--;
    } 
  }

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
