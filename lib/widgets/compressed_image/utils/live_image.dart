import 'package:flutter/material.dart';
import 'view_image.dart';

GestureDetector liveImage({
  required Image img,
  required Widget heroChild,
  required BuildContext context,
  required Size imgSize,
  String? overlayText,
  AlignmentGeometry textAlign = Alignment.topLeft,
}) {
  return GestureDetector(
    onTap: () {
      viewImage(
          context: context,
          imageWidth: imgSize.width.toInt(),
          image: img.image,
          tag: img);
    },
    child: Stack(
      children: [
        Hero(
          tag: img,
          child: heroChild,
        ),
        Positioned(
          left: textAlign == Alignment.topLeft ? 5 : null,
          right: textAlign == Alignment.topRight ? 5 : null,
          top: 3,
          child: Text(
            overlayText ?? '',
          ),
        )
      ],
    ),
  );
}
