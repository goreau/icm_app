import 'package:flutter/material.dart';
import 'package:icm_app/util/db_helper.dart';

class Dropdown extends StatelessWidget {
  final List<DropdownMenuItem<String>> _list = [];
  final int _value = 0;
  //final Function update; // Add this line.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: DropdownButton<String>(
        hint: Text(''),
        value: '0',
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        isExpanded: true,
        items: _list,
        onChanged: (_) {},
      ),
    );
  }
}
