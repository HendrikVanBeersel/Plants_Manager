import 'package:plants_manager/models/plant_species.dart';
import 'package:plants_manager/utils/constants.dart';

class Plant {
  int speciesID;
  bool isOutdoor;
  String nickname;
  String? imageUrl;
  String? location;
  int waterFrequency;
  String? lastWatered;
  String? nextWatering;
  String? notes;
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
      this.health = PlantHealth.healthy})
      : waterFrequency = _calculateWaterFrequency(speciesID);

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

  static int _calculateWaterFrequency(int speciesID) {
    if (waterFrequency == null) {
      switch (waterNeed) {
        case WaterNeed.low:
          return 31;
        case WaterNeed.medium:
          return 7;
        case WaterNeed.high:
          return 1;
        default:
        //needs to throw an error
      }
    }
    return waterFrequency!;
  }
}
