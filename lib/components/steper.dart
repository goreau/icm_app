import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm_app/controllers/visita.controller.dart';

// ignore: must_be_immutable
class CustomStepper extends StatelessWidget {
  final VisitaController ctrl = Get.find();

  CustomStepper(
      {required this.lowerLimit,
      required this.upperLimit,
      required this.stepValue,
      required this.iconSize,
      required this.value});

  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  final double iconSize;
  int value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedIconButton(
          icon: Icons.exposure_minus_1,
          iconSize: this.iconSize,
          onPress: (_) => ctrl.upQuintal(),
        ),
        Container(
          width: 12,
          child: Obx(
            () => TextField(
              controller: ctrl.quintal.value,
              style: TextStyle(
                fontSize: this.iconSize * 0.8,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        RoundedIconButton(
          icon: Icons.add,
          iconSize: this.iconSize,
          onPress: () {},
        ),
      ],
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({
    required this.icon,
    required this.onPress,
    required this.iconSize,
  });

  final IconData icon;
  final Function onPress;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: 12, height: 12),
      elevation: 6.0,
      onPressed: () {},
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12 * 0.2)),
      fillColor: Color(0xFF65A34A),
      child: Icon(
        Icons.access_alarm,
        color: Colors.white,
        size: 12 * 0.8,
      ),
    );
  }
}
