import 'package:flutter/material.dart';

class PrintVariable extends StatelessWidget {
  final String VariablesName;
  final dynamic VariablesValue;
  const PrintVariable(
      {Key? key, required this.VariablesName, required this.VariablesValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [Text('$VariablesName:'), Text('$VariablesValue')],
    );
  }
}
