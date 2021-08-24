import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm_app/components/foto.dart';
import 'package:icm_app/views/preview.page.dart';

class MyCameraController extends GetxController {
  late File arquivo;
  final hasFile = false.obs;

  tirarFoto(file) async{
    file = await Get.to(() => PreviewPage(file: file));
    if (file != null){
      arquivo = file;
      hasFile.value = true;
      Get.back();
    }
  }

  Widget showFoto(){
    return hasFile.value 
      ? Foto(file: arquivo, size: 100)
      : Text('Imagem não disponível');
  }
}