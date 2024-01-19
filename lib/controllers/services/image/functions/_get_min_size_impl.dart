part of '../image_controller.dart';

Future<int> _getMinSizeImpl(Uint8List image, int maxSize) async {
  int low = 0, high = 100, maxQuality = 0;
  while (low <= high) {
    int mid = (low + (high - low) / 2).toInt();
    Uint8List temp = await FlutterImageCompress.compressWithList(
      image,
      quality: mid,
    );
    if (temp.lengthInBytes <= maxSize) {
      maxQuality = mid;
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }
  return maxQuality;
}
