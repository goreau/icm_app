import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm_app/util/auxiliar.dart';
import 'package:icm_app/util/comunica.service.dart';

class ExportaController extends GetxController {
  var retorno = ''.obs;
  var resultado = ''.obs;
  var loading = false.obs;

  ComunicaService _com = new ComunicaService();

  Future<void> postVisitas(BuildContext context) async {
    loading.value = true;

    try {
      var dados;
      Auxiliar.loadEnvio().then((value) async {
        dados = value;

        retorno.value = '';
        var ret = await _com.postVisitas(context, dados);
        // resultado.value = await Auxiliar.changeStatus(ret);
      });
    } catch (ex) {
      retorno.value = 'Erro enviando registros:\r\n' + ex.toString();
    }
    loading.value = false;
  }

  verifEnvio(BuildContext context) async {
    loading.value = true;
    Auxiliar.checkEnvio().then((value) {
      this.retorno.value = value;
    });
    loading.value = false;
  }
}
