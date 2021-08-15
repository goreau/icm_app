import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:icm_app/util/routes.dart';
import 'package:icm_app/views/atividade.dart';
import 'package:icm_app/views/com_importa.dart';
import 'package:icm_app/views/principal.dart';

void main() {
  runApp(GetMaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SisaMob 3',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        Routes.HOME: (_) => Principal(),
        Routes.COM_IMPORTA: (_) => ComImporta(),
        Routes.VISITA: (_) => Atividade(),
      },
      builder: (BuildContext context, Widget widget) {
        Widget error = Text('Encontramos um erro....');
        if (widget is Scaffold || widget is Navigator)
          error = Scaffold(body: Center(child: error));
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) => error;
        return widget;
      },
    );
  }
}
