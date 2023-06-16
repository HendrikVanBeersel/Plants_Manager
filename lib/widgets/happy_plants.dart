import 'package:flutter/material.dart';

class HappyPlants extends StatelessWidget {
  const HappyPlants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('new plant sucesfully added'),
        content: Image.asset('assets/images/happy-plants.gif'));
  }
}
