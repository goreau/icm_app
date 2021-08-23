import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  final String _key;
  List<DropdownMenuItem<String>> _list = [];
  String _value = '0';
  Function update; // Add this line.

  Dropdown(this._key, this._list, this._value, this.update);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: DropdownButton<String>(
        hint: Text(this._key),
        value: this._value,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        isExpanded: true,
        items: _list,
        onChanged: this.update.call(this._value),
      ),
    );
  }
}
