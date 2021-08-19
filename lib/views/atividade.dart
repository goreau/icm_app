import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm_app/controllers/visita.controller.dart';


class Atividade extends StatelessWidget {
  final VisitaController ctrl = Get.put(VisitaController());
  final int ano = DateTime.parse(new DateTime.now().toString()).year;

  @override
  Widget build(BuildContext context) {
    ctrl.loadArea();

    return Card(
      elevation: 10,
      child: Container(
        height: ((MediaQuery.of(context).size.height) / 2),
        padding: EdgeInsets.all(20),
        child: Scaffold(
          appBar: new AppBar(
            title: const Text('Registrar Atividade'),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Form(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.accessibility),
                        title: Text(
                          'Área:',
                          style: new TextStyle(
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        subtitle: Obx(
                          () => ((ctrl.loadingArea.value)
                              ? Center(child: CircularProgressIndicator())
                              : DropdownButton<String>(
                                  hint: Text(''),
                                  value: ctrl.visita.value.idArea,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  isExpanded: true,
                                  items: ctrl.lstArea,
                                  onChanged: (value) {
                                    ctrl.updateArea(value);
                                  },
                                )),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.accessibility),
                        title: Text(
                          'Censitário:',
                          style: new TextStyle(
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        subtitle: Obx(
                          () => ((ctrl.loadingCens.value)
                              ? Center(child: CircularProgressIndicator())
                              : DropdownButton<String>(
                                  hint: Text('Censitário'),
                                  value: ctrl.visita.value.idCensitario,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  isExpanded: true,
                                  items: ctrl.lstCens,
                                  onChanged: (value) {
                                    ctrl.updateCens(value);
                                  },
                                )),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.accessibility),
                        title: Text(
                          'Quarteirão:',
                          style: new TextStyle(
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        subtitle: Obx(
                          () => ((ctrl.loadingQuart.value)
                              ? Center(child: CircularProgressIndicator())
                              : DropdownButton<String>(
                                  hint: Text('Quarteirão'),
                                  value: ctrl.visita.value.idQuarteirao,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  isExpanded: true,
                                  items: ctrl.lstQuart,
                                  onChanged: (value) {
                                    ctrl.updateQuart(value);
                                  },
                                )),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.calendar_today),
                        title: TextFormField(
                          style: new TextStyle(
                            fontSize: 12,
                          ),
                          readOnly: true,
                          controller: null,
                          decoration:
                              InputDecoration(hintText: 'Data da Atividade'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'A data é obrigatória!!';
                            } else {
                              return null;
                            }
                          },
                          onSaved: null,
                          onTap: () async {
                            var date = await showDatePicker(
                              context: context,
                              initialDate:
                                  DateTime.parse(ctrl.dtCadastro.value),
                              firstDate: DateTime(ano - 2),
                              lastDate: DateTime(ano + 1),
                            );
                            await ctrl.getCurrentDate(
                                date.toString().substring(0, 10));
                            //ctrl.dateController.value = ctrl.dtCadastro.value;
                            date.toString().substring(0, 10);
                          },
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.accessibility),
                        title: TextFormField(
                          style: new TextStyle(
                            fontSize: 12,
                          ),
                          controller: ctrl.agenteController,
                          decoration: InputDecoration(labelText: 'Agente'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'O nome é obrigatório!!';
                            } else {
                              ctrl.visita.value.agente = value;
                              return null;
                            }
                          },
                          onSaved: null,
                        ),
                      ), //  SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                ctrl.doRegister();
                              },
                              child: Text('Prosseguir'),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blue)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<List<String>> loadDados(String tab) async {
  await Future.delayed(Duration(seconds: 10), () => print('Tempo ok.'));
  return ['<15', '15-20', '>20'];
}

void _loadPreferences() async {
  var ag = '';
  var ex = 0;
  /*  vis.dt_cadastro = DateTime.now().toString().substring(0, 10);
    try {
      ag = await Storage.recupera('agente');
      ex = await Storage.recupera('exec');
      setState(() {
        vis.agente = ag;
        vis.id_execucao = ex;
        _agenteController.text = ag;
      });
    } catch (e) {}*/
}


