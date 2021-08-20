import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm_app/util/comunica.service.dart';

class ImportaController extends GetxController {
  var retorno = ''.obs;
  var loading = false.obs;

  ComunicaService _com = new ComunicaService();

  Future<void> loadCadastro(BuildContext context) async {
    loading.value = true;
    
    try {
      retorno.value = 'Registros recebidos: \r\n';
      retorno.value += await _com.getCadastro(context);
    } catch (Exception) {
      retorno.value = 'Erro criando lista:' + Exception.toString();
    }
    loading.value = false;
  }
}
