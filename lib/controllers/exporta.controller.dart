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
      Auxiliar.loadEnvio().then((value) {
        dados = value;
      });

      retorno.value = '';
      resultado.value = await _com.postVisitas(context, dados);
    } catch (Exception) {
      retorno.value = 'Erro enviando registros:\r\n' + Exception.toString();
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
