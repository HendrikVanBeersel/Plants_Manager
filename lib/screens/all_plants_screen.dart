import 'package:flutter/material.dart';
import 'package:plants_manager/models/plant.dart';
import 'package:plants_manager/stores/plants_store.dart';
import 'package:plants_manager/widgets/plant_card.dart';
import 'package:provider/provider.dart';

class AllPlantsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Plant> plants = context.read<PlantsStore>().allPlants;
    return Scaffold(
      appBar: AppBar(
        title: Text('All Plants'),
      ),
      body: ListView.builder(
        itemCount: plants.length,
        itemBuilder: (context, index) {
          final plant = plants[index];
          return PlantCard(plant: plant);
        },
      ),
    );
  }
}

