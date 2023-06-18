import 'dart:math';

import 'package:flutter/material.dart';
import 'package:plants_manager/models/plant.dart';
import 'package:plants_manager/models/plant_species.dart';
import 'package:plants_manager/themes/app_colors.dart';
import 'package:plants_manager/widgets/print_variable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PlantInfoScreen extends StatelessWidget {
  final Plant plant;

  const PlantInfoScreen({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlantSpecies species = plant.getSpecies;
    Widget getImage() {
      if (plant.imageUrl != null) {
        return Image.asset(
          plant.imageUrl!,
        );
      } else {
        return Image.asset(
          'assets/images/placeholder.png',
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(plant.nickname),
      ),
      body: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child:
                        Align(alignment: Alignment.topLeft, child: getImage()),
                  ),
                  Expanded(
                    child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: [
                          Text('Species Name:'),
                          Text(species.name),
                          if (species.latinName != null) Text('Latin Name:'),
                          if (species.latinName != null)
                            Text(species.latinName!),
                          Text('Outdoor:'),
                          Text(plant.isOutdoor ? 'Yes' : 'No'),
                          Text('plant health:'),
                          Text(plant.health.toString()),
                        ]),
                  )
                ],
              ),
              if (species.description != null) Text('Description:'),
              if (species.description != null) Text(species.description!),
              Card(
                color: AppColors.infoColor,
                child: InkWell(
                  child: const Text('extra info:',
                      style: TextStyle(color: Colors.white)),
                  onTap: () async {
                    String encodedSearch;
                    if (species.latinName != null) {
                      encodedSearch = Uri.encodeComponent(species.latinName!);
                    } else {
                      encodedSearch = Uri.encodeComponent(species.name);
                    }
                    final url =
                        'https://en.wikipedia.org/wiki/Special:Search?search=$encodedSearch';
                    if (await canLaunchUrlString(url)) {
                      await launchUrlString(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
              if (plant.notes!.length > 0) Text('Notes:'),
              if (plant.notes!.length > 0)
                for (String note in plant.notes!) Text(note),
            ],
          )),
    );
  }
}
