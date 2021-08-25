import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm_app/colors-constants.dart';
import 'package:icm_app/components/steper.dart';
import 'package:icm_app/controllers/camera.controller.dart';
import 'package:icm_app/controllers/visita.controller.dart';

class ViewVisita extends StatelessWidget {
  final VisitaController ctrl = Get.find();
  final MyCameraController cCtrl = Get.put(MyCameraController());

  @override
  Widget build(BuildContext context) {
    ctrl.getPosition();
    return Scaffold(
      appBar: AppBar(
        title: Text('Condição do Imóvel'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.house),
              title: Text(
                'Ordem:',
                style: new TextStyle(
                  fontSize: 13,
                ),
                textAlign: TextAlign.start,
              ),
              subtitle: TextFormField(
                style: new TextStyle(
                  fontSize: 12,
                ),
                decoration: InputDecoration(labelText: 'Ordem'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'O nome é obrigatório!!';
                  } else {
                    return null;
                  }
                },
                controller: ctrl.ordemController,
                onSaved: null,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_road),
              title: Text(
                'Endereço:',
                style: new TextStyle(
                  fontSize: 13,
                ),
                textAlign: TextAlign.start,
              ),
              subtitle: TextFormField(
                style: new TextStyle(
                  fontSize: 12,
                ),
                decoration: InputDecoration(labelText: 'Endereço'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'O nome é obrigatório!!';
                  } else {
                    return null;
                  }
                },
                controller: ctrl.endController,
                onSaved: null,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.other_houses),
              title: Text(
                'N Imovel:',
                style: new TextStyle(
                  fontSize: 13,
                ),
                textAlign: TextAlign.start,
              ),
              subtitle: TextFormField(
                style: new TextStyle(
                  fontSize: 12,
                ),
                decoration: InputDecoration(labelText: 'N Imovel'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'O nome é obrigatório!!';
                  } else {
                    return null;
                  }
                },
                controller: ctrl.numeroController,
                onSaved: null,
              ),
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 50.0, top: 12.0, right: 12.0),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Center(
                  child: Text('Condições:'),
                ),
                CustomStepper(
                  iconSize: 30,
                  controle: 1,
                ),
                CustomStepper(
                  iconSize: 30,
                  controle: 2,
                ),
                CustomStepper(
                  iconSize: 30,
                  controle: 3,
                ),
                CustomStepper(
                  iconSize: 30,
                  controle: 4,
                ),
                CustomStepper(
                  iconSize: 30,
                  controle: 5,
                ),
                CustomStepper(
                  iconSize: 30,
                  controle: 6,
                ),
                CustomStepper(
                  iconSize: 30,
                  controle: 7,
                ),
              ]),
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),
            ListTile(
              leading: const Icon(Icons.pin_drop),
              title: Text(
                'Coordenadas:',
                style: new TextStyle(
                  fontSize: 13,
                ),
                textAlign: TextAlign.start,
              ),
              subtitle: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      enabled: false,
                      style: new TextStyle(
                        fontSize: 12,
                      ),
                      controller: ctrl.latController,
                      onSaved: null,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      enabled: false,
                      style: new TextStyle(
                        fontSize: 12,
                      ),
                      controller: ctrl.lngController,
                      onSaved: null,
                    ),
                  ),
                ],
              ),
            ),
            Obx(() => cCtrl.showFoto()),
            Container(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      ctrl.doPost(context, cCtrl.arquivo);
                    },
                    child: Text('Salvar'),
                    style: ElevatedButton.styleFrom(primary: COR_AZUL)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: COR_AZUL_MARINHO,
        child: Icon(Icons.camera_enhance),
        onPressed: () => Get.to(
          CameraCamera(
            onFile: (file) => cCtrl.tirarFoto(file),
          ),
        ),
      ),
    );
  }
}
/*
ctrl.getPosition();


           







*/