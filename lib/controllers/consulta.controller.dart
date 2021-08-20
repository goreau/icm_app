import 'package:get/get.dart';
import 'package:icm_app/models/visita.dart';

class ConsultaController extends GetxController {
  var loaded = false.obs;
  List<LstVisita> itens = [];

  ConsultaController() {
    inicio();
  }

  Future<void> inicio() async {
    await loadItens();
  }

  Future<void> loadItens() async {
    try {
      /*Map<String, dynamic> json = await _bank.getPropostasEmprestimo();

      var tagObjsJson = json['lista'] as List;
      itens =
          tagObjsJson.map((tagJson) => LstProposta.fromJson(tagJson)).toList();*/
      loaded.value = true;
    } catch (Exception) {
      print('erro criando lista' + Exception.toString());
    }
  }

  excluiVisita(vis){

  }
}