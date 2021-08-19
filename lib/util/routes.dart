import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm_app/views/atividade.dart';
import 'package:icm_app/views/com_importa.dart';
import 'package:icm_app/views/principal.dart';
import 'package:icm_app/views/visita.dart';

class Routes {
  static const HOME = '/';
  static const COM_IMPORTA = '/com_importa';
  static const ATIVIDADE = '/atividade';
  static const VISITA = '/visita';
}

List<GetPage<dynamic>> rotas = [
  GetPage(name: Routes.HOME, page: () => Principal()),
  GetPage(name: Routes.COM_IMPORTA, page: () => ComImporta()),
  GetPage(name: Routes.ATIVIDADE, page: () => Atividade()),
  GetPage(name: Routes.VISITA, page: () => ViewVisita()),
];
