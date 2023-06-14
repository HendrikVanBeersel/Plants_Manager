import 'package:flutter/material.dart';

class AddPlantScreen extends StatefulWidget {
  const AddPlantScreen({super.key});

  @override
  _AddPlantScreenState createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add plant'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Add Plant Page'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/plant_info');
              },
              child: Text('Go to plant info'),
            ),
          ],
        ),
      ),
    );
  }
}
