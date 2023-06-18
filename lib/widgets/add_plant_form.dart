import 'package:flutter/material.dart';
import 'package:plants_manager/models/plant.dart';
import 'package:plants_manager/models/plant_species.dart';
import 'package:plants_manager/stores/plants_store.dart';
import 'package:plants_manager/themes/app_colors.dart';
import 'package:plants_manager/utils/constants.dart';
import 'package:plants_manager/utils/utils.dart';
import 'package:plants_manager/widgets/happy_plants.dart';
import 'package:provider/provider.dart';

class AddPlantForm extends StatefulWidget {
  const AddPlantForm({super.key});

  @override
  _AddPlantFormState createState() => _AddPlantFormState();
}

class _AddPlantFormState extends State<AddPlantForm> {
  //species
  PlantSpecies? selectedSpecies;

  //species values
  String speciesName = '';
  String? latinName;
  String? description;
  String? imageUrlSpecies;
  WaterNeed waterNeed = WaterNeed.medium;
  Sunlight sunlight = Sunlight.partialSun;

  //plant values
  String nickname = '';
  bool isOutdoor = true;
  String? location;
  String? imageUrlPlant;

  void _closePopup() {
    Navigator.of(context).pop();
  }

  void _addedPlant() {
    context.read<PlantsStore>().saveState;
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const HappyPlants();
      },
    );
  }

  getSpeciesForm() {
    return Column(children: [
      const SizedBox(height: 10),
      Row(
        children: [
          const Text("Species name*:"),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Species name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  speciesName = value;
                });
              },
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        children: [
          const Text("Latin name:"),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Latin name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  latinName = value;
                });
              },
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text("description:", textAlign: TextAlign.left),
          ),
          TextField(
            maxLines: null,
            decoration: const InputDecoration(
              hintText: 'description',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                description = value;
              });
            },
          ),
        ],
      ),
      const SizedBox(height: 10),
      Row(children: [
        DropdownMenu<WaterNeed?>(
            label: const Text('Water need'),
            initialSelection: WaterNeed.high,
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: WaterNeed.high, label: 'high'),
              DropdownMenuEntry(value: WaterNeed.medium, label: 'medium'),
              DropdownMenuEntry(value: WaterNeed.low, label: 'low')
            ],
            onSelected: (WaterNeed? value) {
              setState(() {
                waterNeed = value!;
              });
            }),
        const SizedBox(width: 10),
        getWaterNeedIcon(waterNeed),
        const SizedBox(width: 10),
        DropdownMenu<Sunlight>(
          label: const Text('Light need'),
          dropdownMenuEntries: const [
            DropdownMenuEntry(value: Sunlight.fullSun, label: 'full sun'),
            DropdownMenuEntry(value: Sunlight.partialSun, label: 'partial sun'),
            DropdownMenuEntry(value: Sunlight.shade, label: 'shade')
          ],
          onSelected: (Sunlight? value) {
            setState(() {
              sunlight = value!;
            });
          },
        ),
        const SizedBox(width: 10),
        getSunlightIcon(sunlight),
      ]),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry<PlantSpecies?>> dropdownMenuPlantSpecies =
        <DropdownMenuEntry<PlantSpecies?>>[];
    dropdownMenuPlantSpecies.add(const DropdownMenuEntry<PlantSpecies?>(
      value: null,
      label: 'Add new species',
    ));
    dropdownMenuPlantSpecies
        .addAll(context.read<PlantsStore>().allSpecies.map((plantSpecies) {
      return DropdownMenuEntry<PlantSpecies?>(
        value: plantSpecies,
        label: plantSpecies.name,
      );
    }).toList());

    return Material(
      color: AppColors.backgroundColor,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Please fill in your plant\'s info'),
            DropdownMenu<PlantSpecies?>(
              dropdownMenuEntries: dropdownMenuPlantSpecies,
              enableFilter: true,
              controller: TextEditingController(),
              label: const Text('Plant Species'),
              leadingIcon: const Icon(Icons.search),
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 5.0),
              ),
              onSelected: (PlantSpecies? species) {
                setState(() {
                  selectedSpecies = species;
                });
              },
              requestFocusOnTap: true,
            ),
            if (selectedSpecies == null) getSpeciesForm(),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text("Nickname:"),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Nickname',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        nickname = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text("Location:"),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Location',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        location = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(children: [
              const Text("Is outdoor:"),
              const SizedBox(width: 10),
              Switch(
                value: isOutdoor,
                onChanged: (value) {
                  setState(() {
                    isOutdoor = value;
                  });
                },
              ),
            ]),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Add Plant'),
              onPressed: () {
                // Perform the plant adding logic
                // ...
                int selectedSpeciesID = 0;
                if (selectedSpecies == null) {
                  int newGeneratedID =
                      context.read<PlantsStore>().allSpecies.length + 1;

                  PlantSpecies newSpecies = PlantSpecies(
                    speciesID: newGeneratedID,
                    name: speciesName,
                    latinName: latinName,
                    description: description,
                    waterNeed: waterNeed,
                    sunlight: sunlight,
                    imageUrl: imageUrlSpecies,
                  );
                  context.read<PlantsStore>().addSpecies(newSpecies);
                  selectedSpeciesID = newGeneratedID;
                } else {
                  selectedSpeciesID = selectedSpecies!.speciesID;
                }
                Plant newPlant = Plant(
                  speciesID: selectedSpeciesID,
                  nickname: nickname,
                  isOutdoor: isOutdoor,
                  location: location,
                  imageUrl: imageUrlPlant,
                );
                context.read<PlantsStore>().addPlant(newPlant);
                _addedPlant();
              },
            ),
            const SizedBox(height: 10),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                _closePopup();
              },
            ),
          ],
        ),
      ),
    );
  }
}
