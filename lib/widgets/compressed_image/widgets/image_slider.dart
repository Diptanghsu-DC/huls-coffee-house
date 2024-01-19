import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final int maxQuality;
  final double quality;
  final void Function(double) onChanged;
  final void Function(double) onChangeEnd;
  const ImageSlider({
    super.key,
    required this.maxQuality,
    required this.quality,
    required this.onChanged,
    required this.onChangeEnd,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
        trackHeight: 2,
        overlayShape: RoundSliderOverlayShape(overlayRadius: 15),
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
      ),
      child: Slider.adaptive(
        max: maxQuality.toDouble(),
        min: 0,
        activeColor: Colors.black,
        inactiveColor: Colors.black.withOpacity(0.1),
        value: quality,
        onChanged: onChanged,
        onChangeEnd: onChangeEnd,
      ),
    );
  }
}
