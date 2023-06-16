import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plants_manager/utils/constants.dart';

getWaterNeedIcon(WaterNeed waterNeed) {
  switch (waterNeed) {
    case WaterNeed.low:
      return SvgPicture.asset('assets/icons/water-drop-slash-svgrepo-com.svg');
    case WaterNeed.medium:
      return SvgPicture.asset('assets/icons/water-drop-svgrepo-com.svg');
    case WaterNeed.high:
      return SvgPicture.asset('assets/icons/raindrops-alt-svgrepo-com.svg');
  }
}

getSunlightIcon(Sunlight sunlight) {
  switch (sunlight) {
    case Sunlight.fullSun:
      return const Icon(Icons.wb_sunny);
    case Sunlight.partialSun:
      return const Icon(Icons.wb_twighlight);
    case Sunlight.shade:
      return const Icon(Icons.nightlight_round);
  }
}
