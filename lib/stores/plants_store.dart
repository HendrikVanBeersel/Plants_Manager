import 'package:flutter/material.dart';
import 'package:plants_manager/models/plant_species.dart';

import '../models/plant.dart';

class PlantsStore extends ChangeNotifier {
  Map<String, Plant> _plants = {};
  List<PlantSpecies> _species = [];
  Map<String, bool> _wasUpdated = {"plantsInRoom": false};
  Map<String, List<Plant>> _plantsInRooms = {};

  List<Plant> get allPlants => _plants.entries.map((e) => e.value).toList();
  List<PlantSpecies> get allSpecies => _species;

  void addPlant(Plant plant) {
    _plants.addAll({plant.nickname: plant});
    _wasUpdated.updateAll((key, value) => value = true);
    notifyListeners();
  }

  void addSpecies(PlantSpecies species) {
    _species.add(species);
    _wasUpdated.updateAll((key, value) => value = true);
    notifyListeners();
  }

  Plant? getPlant(String plantNickname) {
    return _plants[plantNickname];
  }

  Map<String, List<Plant>> getPlantsInRooms() {
    if (_wasUpdated["plantsInRoom"] == false) {
      return _plantsInRooms;
    } else {
      Map<String, List<Plant>> plantsInRooms = {};
      for (var plant in _plants.values) {
        if (plant.location != null) {
          if (plantsInRooms.containsKey(plant.location)) {
            plantsInRooms[plant.location]!.add(plant);
          } else {
            plantsInRooms[plant.location!] = [plant];
          }
        }
      }
      _wasUpdated["plantsInRoom"] = false;
      _plantsInRooms = plantsInRooms;
      return plantsInRooms;
    }
  }

  List<Plant> getThirstyPlants() {
    List<Plant> thirstyPlants = [];
    for (var plant in _plants.values) {
      if (plant.nextWatering != null) {
        if (DateTime.parse(plant.nextWatering!).isBefore(DateTime.now())) {
          thirstyPlants.add(plant);
        }
      }
    }
    return thirstyPlants;
  }
}
