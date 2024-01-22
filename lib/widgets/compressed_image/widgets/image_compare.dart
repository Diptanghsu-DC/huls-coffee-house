import 'package:flutter/material.dart';

import 'package:huls_coffee_house/widgets/compressed_image/utils/live_image.dart';

class ImageCompare extends StatefulWidget {
  final Image img1;
  final Image img2;
  final Size imgSize;
  final double parentWidth;
  final double sliderWidth;
  final double sliderIconSize;
  const ImageCompare({
    Key? key,
    required this.img1,
    required this.img2,
    required this.imgSize,
    required this.parentWidth,
    this.sliderWidth = 4,
    this.sliderIconSize = 25,
  }) : super(key: key);

  @override
  State<ImageCompare> createState() => _ImageCompareState();
}

class _ImageCompareState extends State<ImageCompare> {
  late double _height;
  double _left = 0;
  @override
  void initState() {
    super.initState();
    _height =
        (widget.parentWidth / widget.imgSize.width) * widget.imgSize.height;
    _left = widget.parentWidth / 2;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.parentWidth,
      child: Stack(
        alignment: Alignment.center,
        children: [
          liveImage(
            img: widget.img1,
            heroChild: widget.img1,
            overlayText: 'Before',
            context: context,
            imgSize: widget.imgSize,
          ),
          Positioned(
            right: 0,
            child: liveImage(
              img: widget.img2,
              overlayText: 'After',
              textAlign: Alignment.topRight,
              context: context,
              imgSize: widget.imgSize,
              heroChild: Container(
                height: _height,
                width: widget.parentWidth - _left,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: widget.img2.image,
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.centerRight,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: _left,
            child: Container(
              height: _height,
              width: widget.sliderWidth,
              color: Colors.black,
            ),
          ),
          Positioned(
            top: _height / 2 - widget.sliderIconSize,
            left: _left - widget.sliderIconSize + widget.sliderWidth / 2,
            child: GestureDetector(
              onPanUpdate: (DragUpdateDetails? drag) {
                if (drag != null) {
                  double x = drag.globalPosition.dx - widget.sliderIconSize * 2;
                  if (x < 0) {
                    x = 0;
                  } else if (x > widget.parentWidth) {
                    x = widget.parentWidth - widget.sliderWidth;
                  }
                  setState(() {
                    _left = x;
                  });
                }
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    color: Colors.transparent,
                    size: widget.sliderIconSize * 2,
                  ),
                  Container(
                    height: widget.sliderIconSize,
                    width: widget.sliderIconSize,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      border: Border.all(
                          color: Colors.black, width: widget.sliderWidth / 2),
                      borderRadius:
                          BorderRadius.circular(widget.sliderIconSize / 2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.chevron_left_rounded,
                          color: Colors.white,
                          size: widget.sliderIconSize / 3,
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.white,
                          size: widget.sliderIconSize / 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
