import 'dart:async';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

Future<void> viewImage(
    {required BuildContext context,
    required ImageProvider image,
    Completer? completer,
    int? imageWidth,
    required dynamic tag}) async {
  Navigator.push(
    context,
    PageRouteBuilder(
      barrierDismissible: true,
      opaque: false,
      pageBuilder: (context, _, __) {
        return FutureBuilder(
            future: completer?.future,
            builder: (context, AsyncSnapshot snapshot) {
              return Dialog(
                backgroundColor: Colors.transparent,
                child: Hero(
                  tag: tag,
                  child: PhotoView(
                    imageProvider: image,
                    backgroundDecoration:
                        const BoxDecoration(color: Colors.transparent),
                    tightMode: true,
                    minScale: MediaQuery.of(context).size.width /
                        (snapshot.hasData
                            ? snapshot.data.width
                            : imageWidth ?? 1),
                  ),
                ),
              );
            });
      },
    ),
  );
}
