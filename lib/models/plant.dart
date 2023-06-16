import 'package:plants_manager/stores/plants_store.dart';
import 'package:plants_manager/utils/constants.dart';

class Plant {
  int speciesID;
  bool isOutdoor;
  String nickname;
  String? imageUrl;
  String? location;
  int? waterFrequency;
  String? lastWatered;
  String? nextWatering;
  List<String>? notes;
  PlantHealth health;

  Plant(
      {required this.speciesID,
      required this.isOutdoor,
      required this.nickname,
      this.imageUrl,
      this.location,
      this.lastWatered,
      this.nextWatering,
      this.notes,
      this.health = PlantHealth.healthy,
      this.waterFrequency});

  Plant.fromJson(Map<String, dynamic> json)
      : speciesID = json['speciesID'],
        isOutdoor = json['isOutdoor'],
        nickname = json['nickname'],
        imageUrl = json['imageUrl'],
        location = json['location'],
        waterFrequency = json['waterFrequency'],
        lastWatered = json['lastWatered'],
        nextWatering = json['nextWatering'],
        notes = json['notes'],
        health = PlantHealth.values[json['health']];

  Plant.toJson(Plant plant)
      : speciesID = plant.speciesID,
        isOutdoor = plant.isOutdoor,
        nickname = plant.nickname,
        imageUrl = plant.imageUrl,
        location = plant.location,
        waterFrequency = plant.waterFrequency,
        lastWatered = plant.lastWatered,
        nextWatering = plant.nextWatering,
        notes = plant.notes,
        health = plant.health;
  set setHealth(PlantHealth newHealth) => health = newHealth;
  set setWaterFrequency(int newFrequency) => waterFrequency = newFrequency;

  get getHealth => health;
  get getWaterFrequency => waterFrequency;
  get getSpecies => PlantsStore().getSpecies(speciesID);
  get getNickname => nickname;
  get getIsOutdoor => isOutdoor;
  get getLocation => location;
  get getLastWatered => lastWatered;
  get getNextWatering => nextWatering;
  get getNotes => notes;
  get getImageUrl => imageUrl;
}
