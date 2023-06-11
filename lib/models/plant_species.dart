//add plant class here
import 'package:plants_manager/utils/constants.dart';

class PlantSpecies {
  String name;
  String? latinName;
  String? description;
  String? imageUrl;
  WaterNeed waterNeed;
  Sunlight sunlight;
  int? waterFrequency;

  PlantSpecies(
      {required this.name,
      this.latinName,
      this.description,
      this.imageUrl,
      required this.waterNeed,
      required this.sunlight,
      this.waterFrequency});

  PlantSpecies.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        latinName = json['latinName'],
        description = json['description'],
        imageUrl = json['imageUrl'],
        waterNeed = WaterNeed.values[json['waterNeed']],
        sunlight = Sunlight.values[json['sunlight']],
        waterFrequency = json['waterFrequency'];
}
