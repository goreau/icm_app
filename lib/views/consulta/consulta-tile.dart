import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:icm_app/colors-constants.dart';
import 'package:icm_app/controllers/consulta.controller.dart';
import 'package:icm_app/models/visita.dart';
import 'package:icm_app/util/routes.dart';

class ConsultaTile extends StatelessWidget {
  final LstDetail prop;
  final ConsultaController ctrl = Get.put(ConsultaController());

  ConsultaTile(this.prop);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: ListTile(
        leading: trocaIcone(prop.status),
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 14,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Ordem: ',
              ),
              TextSpan(
                  text: '${prop.ordem}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Data: ',
                  ),
                  TextSpan(
                      text: '${prop.endereco}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Detalhar',
          color: Colors.green,
          icon: Icons.edit,
          onTap: () => {Get.toNamed(Routes.ATIVIDADE, arguments: prop.id)},
        ),
      ],
      secondaryActions: <Widget>[
        prop.status < 4
            ? IconSlideAction(
                caption: 'Excluir',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () => {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text(
                        'Excluir visita',
                        style: new TextStyle(
                            fontSize: 20,
                            color: COR_AZUL_MARINHO,
                            fontWeight: FontWeight.bold),
                      ),
                      content: Text('Confirma a exclusão dessa visita?'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Não'),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        TextButton(
                          child: Text('Sim'),
                          onPressed: () {
                            ctrl.excluiVisita(prop.id);
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ),
                },
              )
            : SlideAction(
                child: Text(''),
              ),
      ],
    );
  }

  Icon trocaIcone(int stt) {
    Icon ret;
    switch (stt) {
      case 0:
        ret = Icon(
          Icons.lock_open,
          color: Colors.green,
        );
        break;
      default:
        ret = Icon(
          Icons.lock,
          color: Colors.red,
        );
        break;
    }

    return ret;
  }
}
