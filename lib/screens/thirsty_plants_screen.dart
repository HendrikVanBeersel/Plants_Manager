import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ThirstyPlantsScreen extends StatefulWidget {
  const ThirstyPlantsScreen({super.key});

  @override
  _ThirstyPlantsScreenState createState() => _ThirstyPlantsScreenState();
}

class _ThirstyPlantsScreenState extends State<ThirstyPlantsScreen> {
  late VideoPlayerController videoController;

  @override
  void initState() {
    super.initState();
    videoController =
        VideoPlayerController.network('assets/video/plantInfo.mp4')
          ..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    videoController.initialize();
    return Scaffold(
      appBar: AppBar(
        title: Text('Video about plants'),
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9,
            child: VideoPlayer(videoController),
          ),
          ElevatedButton(
            onPressed: () {
              if (videoController.value.isPlaying) {
                videoController.pause();
              } else {
                videoController.play();
              }
            },
            child: Icon(
              videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
              size: 60,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoController.dispose();
  }
}
