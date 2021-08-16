import 'package:flutter/material.dart';
//import 'package:icm_app/components/dropdown.dart';
//import 'package:icm_app/models/visita.dart';
//import 'package:icm_app/util/auxiliar.dart';
//import 'package:icm_app/util/storage.dart';

class Atividade extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //print('create $lstMun');
    /*  if (lstMun == null || lstAtiv == null) {
      return CircularProgressIndicator();
    }*/
    return Card(
      elevation: 10,
      child: Container(
        height: ((MediaQuery.of(context).size.height) / 2),
        padding: EdgeInsets.all(20),
        child: Scaffold(
          appBar: new AppBar(
            title: const Text('Registrar Atividade'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Form(
                key: key,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.accessibility),
                      title: TextFormField(
                        style: new TextStyle(
                          fontSize: 12,
                        ),
                        controller: null,
                        decoration: InputDecoration(labelText: 'Agente'),
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
                    /* ListTile(
                  leading: const Icon(Icons.accessibility),
                  title: Text(
                    'Área:',
                    style: new TextStyle(
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  subtitle: (lstArea == null)
                      ? SizedBox(
                          child: CircularProgressIndicator(),
                          height: 50.0,
                          width: 50.0)
                      : Dropdown('Área', lstArea, vis.id_area,
                          update: _updateArea),
                ),
                ListTile(
                  leading: const Icon(Icons.construction),
                  title: Text(
                    'Censitário:',
                    style: new TextStyle(
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  subtitle: (lstCens == null)
                      ? Text('Aguardando...')
                      : ((vis.id_area != oldArea)
                          ? Center(child: CircularProgressIndicator())
                          : Dropdown('Censitário:', lstCens, vis.id_censitario,
                              update: _updateCens)),
                ),
                ListTile(
                  leading: const Icon(Icons.construction),
                  title: Text(
                    'Quarteirao:',
                    style: new TextStyle(
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  subtitle: (lstQuart == null)
                      ? Text('Aguardando...')
                      : ((vis.id_censitario != oldCens)
                          ? Center(child: CircularProgressIndicator())
                          : Dropdown('Quarteirão:', lstQuart, vis.id_quarteirao,
                              update: _updateQuart)),
                ),*/
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
                          /*if (value.isEmpty) {
                            return 'O nome é obrigatório!!';
                          } else {*/
                          return null;
                          // }
                        },
                        onSaved: null,
                        onTap: () async {
                          /* var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.parse(vis.dt_cadastro),
                            firstDate: DateTime(ano - 2),
                            lastDate: DateTime(ano + 1),
                          );*/
                          /* await getCurrentDate(
                              date.toString().substring(0, 10));
                          dateController.text = vis.dt_cadastro;*/
                          //date.toString().substring(0, 10);
                        },
                      ),
                    ),
                    //  SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              _doRegister();
                            },
                            child: Text('Prosseguir'),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.blue)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
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

void _doRegister() async {
  /* await _loadChoices();
    if (vis.id_execucao < 1 || vis.id_atividade == 0 || vis.id_municipio == 0) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(SnackBar(
        content: const Text('Todos os campos são obrigatórios.'),
        backgroundColor: Colors.redAccent[700],
      ));
      return;
    }
    if (_form.currentState.validate()) {
      _form.currentState.save();
      Storage.insere('agente', vis.agente);
      Storage.insere('exec', vis.id_execucao);

      if ([5, 6.7].contains(vis.id_atividade)) {
        /*Navigator.of(context).pushNamed(
          Routes.VIS_IMOVEL,
          arguments: vis, //saved,
        );*/
      }

  void _loadChoices() async {
    try {
      var atv = await Storage.recupera('atividade');
      var mnc = await Storage.recupera('municipio');
      vis.id_atividade = int.parse(atv);
      vis.id_municipio = int.parse(mnc);
    } catch (e) {}
  }

  // Add this function.
  void getCurrentDate(String date) async {
    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    setState(() {
      vis.dt_cadastro = formattedDate.toString();
    });
  }

  void _handleRadioExecChange(int value) {
    setState(() {
      vis.id_execucao = value;
    });
  }

  void _updateAtiv(String b) {
    setState(() {
      vis.id_atividade = int.parse(b);
    });
  }

  void _updateMun(String b) {
    setState(() {
      vis.id_municipio = int.parse(b);
    });
  }*/
}
