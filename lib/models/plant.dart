//add plant class here
import 'package:plants_manager/utils/constants.dart';

class Plant {
  String name;
  String? latinName;
  String? description;
  String? imageUrl;
  WaterNeed waterNeed;
  Sunlight sunlight;
  String? waterFrequency;

  Plant(
      {required this.name,
      this.latinName,
      this.description,
      this.imageUrl,
      required this.waterNeed,
      required this.sunlight,
      this.waterFrequency});

}