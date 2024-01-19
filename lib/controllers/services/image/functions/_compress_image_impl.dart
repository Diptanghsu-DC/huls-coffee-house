part of '../image_controller.dart';

Future<Uint8List?> _compressedImageImpl({
  required ImageSource source,
  required int maxSize,
  required BuildContext context,
}) async {
  XFile? file = await ImagePicker().pickImage(source: source);
  if (file == null) return null;

  Uint8List? image = await file.readAsBytes();
  int size = await file.length();
  if (size > maxSize) {
    int maxQuality = await ImageController._getMinSize(image, maxSize);
    if (maxQuality == 0) {
      throw Exception("Please select an image with lower resolution");
    }
    image = await ImageController._userCompression(
      image: image,
      maxQuality: maxQuality,
      context: context,
    );
  }
  return image;
}
