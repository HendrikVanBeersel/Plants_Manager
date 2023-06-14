import 'package:flutter/material.dart';
import 'package:plants_manager/models/plant.dart';

class PlantCard extends StatefulWidget {
  final Plant plant;

  const PlantCard({Key? key, required this.plant}) : super(key: key);

  @override
  _PlantCardState createState() => _PlantCardState();
}

class _PlantCardState extends State<PlantCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? Colors.green : Colors.white,
      child: InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(widget.plant.nickname),
            ],
          ),
        ),
      ),
    );
  }
}
