import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm_app/components/steper.dart';
import 'package:icm_app/controllers/visita.controller.dart';

class Visita extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);
  final VisitaController crtl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Condição do Imóvel'),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          ListTile(
            leading: const Icon(Icons.accessibility),
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
                /*if (value.isEmpty) {
                            return 'O nome é obrigatório!!';
                          } else {*/
                return null;
                // }
              },
              onSaved: null,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.accessibility),
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
                /*if (value.isEmpty) {
                            return 'O nome é obrigatório!!';
                          } else {*/
                return null;
                // }
              },
              onSaved: null,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.accessibility),
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
                /*if (value.isEmpty) {
                            return 'O nome é obrigatório!!';
                          } else {*/
                return null;
                // }
              },
              onSaved: null,
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            CustomStepper(
                lowerLimit: 0,
                upperLimit: 100,
                stepValue: 1,
                iconSize: 20,
                value: 0),
          ]),
        ]),
      ),
    );
  }
}
