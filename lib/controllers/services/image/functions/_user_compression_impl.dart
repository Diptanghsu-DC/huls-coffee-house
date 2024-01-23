part of "../image_controller.dart";

Future<Uint8List?> _userCompressionImpl({
  required Uint8List image,
  required int maxQuality,
  required BuildContext context,
}) async {
  Uint8List? compressed = await Navigator.push(
    context,
    PageRouteBuilder(
      opaque: false,
      barrierColor: Colors.black26,
      barrierDismissible: true,
      pageBuilder: (context, _, __) {
        return ImageCompressor(image: image, maxQuality: maxQuality);
      },
    ),
  );
  return compressed;
}
