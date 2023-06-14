import 'package:plants_manager/models/plant.dart';
import 'package:plants_manager/models/plant_species.dart';

import '../utils/constants.dart';

Plant plantAloevera = Plant(
    speciesID: 1,
    isOutdoor: false,
    nickname: 'Aloe Vera',
    imageUrl: 'assets/testImages/aloe-vera.jpg',
    location: 'Living Room',
    waterFrequency: 14,
    lastWatered: '2021-08-01',
    nextWatering: '2021-08-15',
    notes: 'This plant is very sensitive to overwatering.',
    health: PlantHealth.healthy);

Plant plantBasil = Plant(
    speciesID: 2,
    isOutdoor: false,
    nickname: 'Basil',
    imageUrl: 'assets/testImages/basil.jpg',
    location: 'Kitchen',
    waterFrequency: 3,
    lastWatered: '2021-08-01',
    nextWatering: '2021-08-04',
    notes: 'This plant is very sensitive to overwatering.',
    health: PlantHealth.healthy);

Plant plantCactus = Plant(
    speciesID: 3,
    isOutdoor: false,
    nickname: 'Cactus',
    imageUrl: 'assets/testImages/angel-wings-cactus.jpg',
    location: 'Living Room',
    waterFrequency: 30,
    lastWatered: '2021-08-01',
    nextWatering: '2021-08-31',
    notes: 'This plant is very sensitive to overwatering.',
    health: PlantHealth.healthy);
Plant plantDaisy =
    Plant(isOutdoor: true, speciesID: 4, nickname: 'Daisy', waterFrequency: 7);
Plant plantEucalyptus = Plant(
    isOutdoor: true, speciesID: 5, nickname: 'Eucalyptus', waterFrequency: 7);
Plant plantFern =
    Plant(isOutdoor: true, speciesID: 6, nickname: 'Fern', waterFrequency: 7);
Plant plantGardenia = Plant(
    isOutdoor: true, speciesID: 7, nickname: 'Gardenia', waterFrequency: 7);

PlantSpecies speciesAloevera = PlantSpecies(
  speciesID: 1,
  name: 'Aloe Vera',
  imageUrl:
      'https://cdn.pixabay.com/photo/2017/02/08/17/24/aloe-2042901_960_720.jpg',
  description:
      'Aloe vera is a succulent plant species of the genus Aloe. An evergreen perennial, it originates from the Arabian Peninsula, but grows wild in tropical, semi-tropical, and arid climates around the world. It is cultivated for agricultural and medicinal uses. The species is also used for decorative purposes and grows successfully indoors as a potted plant.',
  waterNeed: WaterNeed.low,
  sunlight: Sunlight.fullSun,
);
PlantSpecies speciesBasil = PlantSpecies(
  speciesID: 2,
  name: 'Basil',
  imageUrl:
      'https://cdn.pixabay.com/photo/2017/08/05/18/29/basil-2583210_960_720.jpg',
  description:
      'Basil, also called great basil, is a culinary herb of the family Lamiaceae. Basil is native to tropical regions from central Africa to Southeast Asia. It is a tender plant, and is used in cuisines worldwide. Depending on the species and cultivar, the leaves may taste somewhat like anise, with a strong, pungent, often sweet smell.',
  waterNeed: WaterNeed.medium,
  sunlight: Sunlight.fullSun,
);
PlantSpecies speciesCactus = PlantSpecies(
  speciesID: 3,
  name: 'Cactus',
  imageUrl:
      'https://cdn.pixabay.com/photo/2017/02/08/17/24/cactus-2042900_960_720.jpg',
  description:
      'A cactus is a member of the plant family Cactaceae, a family comprising about 127 genera with some 1750 known species of the order Caryophyllales. The word "cactus" derives, through Latin, from the Ancient Greek κάκτος, kaktos, a name originally used by Theophrastus for a spiny plant whose identity is now not certain.',
  waterNeed: WaterNeed.low,
  sunlight: Sunlight.fullSun,
);
PlantSpecies speciesDaisy = PlantSpecies(
  speciesID: 4,
  name: 'Daisy',
  imageUrl:
      'https://cdn.pixabay.com/photo/2017/08/05/18/29/basil-2583210_960_720.jpg',
  description:
      'Bellis perennis is a common European species of daisy, of the Asteraceae family, often considered the archetypal species of that name. Many related plants also share the name "daisy", so to distinguish this species from other daisies it is sometimes qualified as common daisy, lawn daisy or English daisy.',
  waterNeed: WaterNeed.medium,
  sunlight: Sunlight.fullSun,
);
PlantSpecies speciesEucalyptus = PlantSpecies(
  speciesID: 5,
  name: 'Eucalyptus',
  imageUrl:
      'https://cdn.pixabay.com/photo/2017/08/05/18/29/basil-2583210_960_720.jpg',
  description:
      'Eucalyptus is a genus of over seven hundred species of flowering trees, shrubs or mallees in the myrtle family, Myrtaceae. Along with several other genera in the tribe Eucalypteae, including Corymbia, they are commonly known as eucalypts. Plants in the genus Eucalyptus have bark that is either smooth, fibrous, hard or stringy, leaves with oil glands, and sepals and petals that are fused to form a "cap" or operculum over the stamens.',
  waterNeed: WaterNeed.medium,
  sunlight: Sunlight.fullSun,
);
PlantSpecies speciesFern = PlantSpecies(
  speciesID: 6,
  name: 'Fern',
  imageUrl:
      'https://cdn.pixabay.com/photo/2017/08/05/18/29/basil-2583210_960_720.jpg',
  description:
      'A fern is a member of a group of vascular plants that reproduce via spores and have neither seeds nor flowers. They differ from mosses by being vascular, i.e., having specialized tissues that conduct water and nutrients and in having life cycles in which the sporophyte is the dominant phase. Like other vascular plants, ferns have complex leaves called megaphylls, that are more complex than the microphylls of clubmosses. Most ferns are leptosporangiate ferns, sometimes referred to as true ferns. They produce coiled fiddleheads that uncoil and expand into fronds. The group includes about 10,560 known extant species.',
  waterNeed: WaterNeed.medium,
  sunlight: Sunlight.partialSun,
);
PlantSpecies speciesGardenia = PlantSpecies(
  speciesID: 7,
  name: 'Gardenia',
  imageUrl:
      'https://cdn.pixabay.com/photo/2017/08/05/18/29/basil-2583210_960_720.jpg',
  description:
      'Gardenia is a genus of flowering plants in the coffee family, Rubiaceae, native to the tropical and subtropical regions of Africa, Asia, Madagascar and Pacific Islands, and Australia.',
  waterNeed: WaterNeed.medium,
  sunlight: Sunlight.partialSun,
);

Map<int, PlantSpecies> speciesMap = {
  1: speciesAloevera,
  2: speciesBasil,
  3: speciesCactus,
  4: speciesDaisy,
  5: speciesEucalyptus,
  6: speciesFern,
  7: speciesGardenia,
};
Map<String, Plant> plantMap = {
  'Aloe Vera': plantAloevera,
  'Basil': plantBasil,
  'Cactus': plantCactus,
  'Daisy': plantDaisy,
  'Eucalyptus': plantEucalyptus,
  'Fern': plantFern,
  'Gardenia': plantGardenia,
};
