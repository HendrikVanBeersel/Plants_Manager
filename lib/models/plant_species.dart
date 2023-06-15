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
  int speciesID;

  PlantSpecies(
      {required this.name,
      this.latinName,
      this.description,
      this.imageUrl,
      required this.waterNeed,
      required this.sunlight,
      this.waterFrequency,
      required this.speciesID});

  PlantSpecies.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        latinName = json['latinName'],
        description = json['description'],
        imageUrl = json['imageUrl'],
        waterNeed = WaterNeed.values[json['waterNeed']],
        sunlight = Sunlight.values[json['sunlight']],
        waterFrequency = json['waterFrequency'],
        speciesID = json['speciesID'];

  PlantSpecies.toJson(PlantSpecies plantSpecies)
      : name = plantSpecies.name,
        latinName = plantSpecies.latinName,
        description = plantSpecies.description,
        imageUrl = plantSpecies.imageUrl,
        waterNeed = plantSpecies.waterNeed,
        sunlight = plantSpecies.sunlight,
        waterFrequency = plantSpecies.waterFrequency,
        speciesID = plantSpecies.speciesID;

  get getName => name;
  get getLatinName => latinName;
  get getDescription => description;
  get getImageUrl => imageUrl;
}
