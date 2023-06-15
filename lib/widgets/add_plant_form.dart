import 'package:flutter/material.dart';
import 'package:plants_manager/models/plant_species.dart';
import 'package:plants_manager/stores/plants_store.dart';
import 'package:plants_manager/utils/constants.dart';
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
            if (selectedSpecies == null)
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
            if (selectedSpecies == null)
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
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Add Plant'),
              onPressed: () {
                // Perform the plant adding logic
                // ...
                _closePopup();
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
