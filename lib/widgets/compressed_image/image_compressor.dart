import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/utils/formatter.dart';
import 'package:huls_coffee_house/widgets/compressed_image/widgets/cancel_button.dart';
import 'package:huls_coffee_house/widgets/compressed_image/widgets/image_slider.dart';
import 'package:huls_coffee_house/widgets/compressed_image/widgets/loading.dart';
import 'package:huls_coffee_house/widgets/compressed_image/widgets/save_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:huls_coffee_house/dialogs/loading_overlay/loading_overlay.dart';
import 'widgets/image_compare.dart';

class ImageCompressor extends StatefulWidget {
  final Uint8List image;
  final double cardWidth;
  final int maxQuality;
  const ImageCompressor({
    Key? key,
    required this.image,
    this.maxQuality = 0,
    this.cardWidth = 240,
  }) : super(key: key);

  @override
  State<ImageCompressor> createState() => ImageCompressorState();
}

class ImageCompressorState extends State<ImageCompressor> {
  Completer<ui.Image> completer = Completer<ui.Image>();
  late double quality;
  late ImageProvider image;
  final double padding = 15;
  late Uint8List img;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    img = widget.image;
    quality = min(widget.maxQuality.toDouble(), 80);
    image = Image.memory(img).image;
    image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info.image);
    }));
    initialCompression();
  }

  Future initialCompression() async {
    setState(() {
      isLoading = true;
    });
    Uint8List? cache = await FlutterImageCompress.compressWithList(
      img,
      quality: quality.toInt(),
    );
    setState(() {
      img = cache;
      isLoading = false;
    });
  }

  Future _compress() async {
    showLoadingOverlay(
        context: context,
        onCompleted: () => setState(() {}),
        asyncTask: () async {
          Uint8List? cache = await FlutterImageCompress.compressWithList(
            widget.image,
            quality: quality.toInt(),
          );
          setState(() {
            img = cache;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: isLoading
          ? const Loading()
          : FutureBuilder(
              future: completer.future,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(padding),
                      child: Column(
                        children: [
                          ImageCompare(
                            img1: Image.memory(widget.image),
                            imgSize: Size(
                              snapshot.data.width.toDouble(),
                              snapshot.data.height.toDouble(),
                            ),
                            parentWidth: widget.cardWidth,
                            img2: Image.memory(img),
                          ),
                          Text(
                            Formatter.getSize(size: img.lengthInBytes),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text("${quality.toStringAsFixed(0)}%"),
                              ),
                              Expanded(
                                flex: 6,
                                child: ImageSlider(
                                  maxQuality: widget.maxQuality,
                                  quality: quality,
                                  onChanged: (val) {
                                    setState(() {
                                      quality = val;
                                    });
                                  },
                                  onChangeEnd: (_) {
                                    _compress();
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomCancelButton(
                                cardWidth: widget.cardWidth,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              CustomSaveButton(
                                cardWidth: widget.cardWidth,
                                onPressed: () {
                                  Navigator.pop(context, img);
                                },
                              ),
                            ].separate(15),
                          )
                        ].separate(10),
                      ),
                    ),
                  );
                } else {
                  return const Loading();
                }
              },
            ),
    );
  }
}
