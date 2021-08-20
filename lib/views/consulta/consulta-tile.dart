
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:icm_app/controllers/consulta.controller.dart';
import 'package:icm_app/models/visita.dart';



class ConsultaTile extends StatelessWidget {
  final LstVisita prop;
  final ConsultaController crtl = Get.put(ConsultaController());

  
  ConsultaTile(this.prop);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: ListTile(
        leading: CircleAvatar(
          child: trocaIcone(prop.status),
          backgroundColor: Colors.amber.shade50,
        ),
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 14,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Valor Solicitado: ',
              ),
              TextSpan(
                  text: '${prop.valor}',
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
                      text: '${prop.dtSolicita}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Situação: ',
                  ),
                  TextSpan(
                      text: '${trocaStatus(prop.status)}',
                      style: TextStyle(
                        fontSize: 13,
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
          onTap: () => {
           // _crtl_prop.idProposta.value = int.parse(prop.operacaoCcb),
          //  _crtl_ini.selectedIndex = 0
           /* Get.toNamed(Routes.EMP_TIMELINE,
                arguments: int.parse(prop.operacaoCcb))*/
          },
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
                title: Text('Excluir solicitação'),
                content: Text('Confirma a operação?'),
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
                      excluiProposta();
                      //excluir a proposta aqui
                      Get.back();
                    },
                  ),
                ],
              ),
            )
          },
        )
        : SlideAction(
          child: Text(''),
        ),
      ],
    );
  }


  excluiProposta(){
    crtl.excluiVisita(prop);
  }

  String trocaStatus(int stt) {
    String ret = '';
    switch (stt) {
      case 0:
      case 1:
        ret = 'Iniciada';
        break;
      case 2:
        ret = 'A aprovar';
        break;
      case 3:
        ret = 'Gerar link';
        break;
      case 4:
        ret = 'A assinar';
        break;
      case 5:
        ret = 'A Pagar';
        break;
      default:
        ret = 'Pago';
    }

    return ret;
  }

  Icon trocaIcone(int stt) {
    Icon ret;
    switch (stt) {
      case 1:
        ret = Icon(Icons.add_road_outlined);
        break;
      case 2:
        ret = Icon(Icons.saved_search);
        break;
      case 3:
        ret = Icon(Icons.link);
        break;
      case 4:
        ret = Icon(Icons.create_outlined);
        break;
      case 5:
        ret = Icon(
          Icons.attach_money,
          color: Colors.red,
        );
        break;
      default:
        ret = Icon(
          Icons.attach_money,
          color: Colors.green,
        );
    }

    return ret;
  }
}
