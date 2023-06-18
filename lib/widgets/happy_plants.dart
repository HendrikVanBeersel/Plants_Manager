import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class HappyPlants extends StatefulWidget {
  const HappyPlants({Key? key}) : super(key: key);

  @override
  _HappyPlantsState createState() => _HappyPlantsState();
}

class _HappyPlantsState extends State<HappyPlants> {
  AudioPlayer audioPlayer = AudioPlayer();

  void playSuccessSound() async {
    await audioPlayer.play(AssetSource('sounds/success.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    playSuccessSound();
    return AlertDialog(
      title: const Text('New plant successfully added'),
      content: Image.asset('assets/images/happy-plants.gif'),
    );
  }
}
