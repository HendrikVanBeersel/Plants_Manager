import 'package:flutter/material.dart';
import 'package:plants_manager/models/plant.dart';
import 'package:plants_manager/screens/plant_info_screen.dart';

class PlantCard extends StatefulWidget {
  final Plant plant;
  final bool brief;

  const PlantCard({Key? key, required this.plant, this.brief = false})
      : super(key: key);

  @override
  _PlantCardState createState() => _PlantCardState();
}

class _PlantCardState extends State<PlantCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    if (widget.plant.imageUrl != null) {
      imageWidget = Image.asset(
        widget.plant.imageUrl!,
      );
    } else {
      imageWidget = Image.asset('assets/images/placeholder.png');
    }
    return Card(
      color: isSelected ? Colors.green : Colors.white,
      child: InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        onDoubleTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlantInfoScreen(plant: widget.plant)));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (!widget.brief) imageWidget,
              Text(widget.plant.nickname),
              Text(widget.plant.getSpecies.name),
              Text(widget.plant.getSpecies.waterNeed.toString()),
              Text(widget.plant.getSpecies.sunlight.toString()),
              if (!widget.brief) Text(widget.plant.isOutdoor.toString()),
              Text(widget.plant.health.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
