import 'package:plants_manager/models/plant_species.dart';
import 'package:plants_manager/utils/constants.dart';

class Plant {
  PlantSpecies species;
  bool isOutdoor;
  String? nickname;
  String? imageUrl;
  String? location;
  int waterFrequency;
  String? lastWatered;
  String? nextWatering;
  String? notes;
  PlantHealth health;

  Plant(
      {required this.species,
      required this.isOutdoor,
      this.nickname,
      this.imageUrl,
      this.location,
      this.lastWatered,
      this.nextWatering,
      this.notes,
      this.health = PlantHealth.healthy})
      : waterFrequency =
            _calculateWaterFrequency(species.waterNeed, species.waterFrequency);

  static int _calculateWaterFrequency(
      WaterNeed waterNeed, int? waterFrequency) {
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
