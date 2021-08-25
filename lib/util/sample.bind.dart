import 'package:get/get.dart';
import 'package:icm_app/controllers/camera.controller.dart';
import 'package:icm_app/controllers/visita.controller.dart';

class SampleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisitaController>(() => VisitaController());
    Get.lazyPut<MyCameraController>(() => MyCameraController());
  }
}
