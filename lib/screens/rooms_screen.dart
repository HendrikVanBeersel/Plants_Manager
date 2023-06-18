import 'package:flutter/material.dart';
import 'package:plants_manager/models/plant.dart';
import 'package:plants_manager/stores/plants_store.dart';
import 'package:provider/provider.dart';

import '../widgets/plant_card.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({super.key});

  @override
  _RoomsScreenState createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  String roomToShow = '';

  @override
  Widget build(BuildContext context) {
    Map<String, List<Plant>> roomsWithPlants =
        context.watch<PlantsStore>().getPlantsInRooms();

    List<String> rooms = roomsWithPlants.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('rooms'),
      ),
      body: ListView.builder(
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            final String room = rooms[index];
            return Column(children: [
              Card(
                child: InkWell(
                  child: Text(room),
                  onTap: () {
                    setState(() {
                      roomToShow = room;
                    });
                  },
                ),
              ),
              if (roomToShow == room)
                //does not work because there are 2 scrolls in 1
                ListView.builder(
                  itemCount: roomsWithPlants[room]!.length,
                  itemBuilder: (context, index) {
                    List<Plant> plants = roomsWithPlants[room]!;
                    final plant = plants[index];
                    return PlantCard(plant: plant, brief: true);
                  },
                ),
            ]);
          }),
    );
  }
}
