import 'dart:math';
import 'dart:typed_data';
import 'package:cloudinary/cloudinary.dart';
// import 'package:efficacy_admin/utils/database/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:huls_coffee_house/utils/database/constants.dart';
import 'package:huls_coffee_house/widgets/compressed_image/image_compressor.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:efficacy_admin/widgets/compressed_image/image_compressor.dart';

part 'functions/_upload_image_impl.dart';
part 'functions/_compress_image_impl.dart';
part 'functions/_get_min_size_impl.dart';
part 'functions/_user_compression_impl.dart';
part 'functions/_delete_impl.dart';

class UploadInformation {
  final String? url;
  final String? publicID;
  const UploadInformation({
    required this.url,
    required this.publicID,
  });
}

enum ImageFolder {
  // eventThumbnail("events/posters"),
  productImage("products/image");
  // clubImage("clubs/club"),
  // clubBanner("clubs/banner");

  final String name;
  const ImageFolder(this.name);
}

class ImageController {
  const ImageController._();

  static Future<int> _getMinSize(Uint8List image, int maxSize) async {
    return _getMinSizeImpl(image, maxSize);
  }

  static Future<Uint8List?> _userCompression({
    required Uint8List image,
    required int maxQuality,
    required BuildContext context,
  }) async {
    return _userCompressionImpl(
      image: image,
      maxQuality: maxQuality,
      context: context,
    );
  }

  /// Uploads image to the server and
  /// returns the url if the image was uploaded successfully
  ///
  /// For [ImageFolder.eventThumbnail]
  /// required: [clubName] and [eventName]
  ///
  /// For [ImageFolder.userImage], [ImageFolder.clubBanner] and [ImageFolder.clubImage]
  /// required: [name]
  static Future<UploadInformation> uploadImage({
    required Uint8List img,
    String? productName,
    String? publicID,
    required ImageFolder folder,
    void Function(int count, int total)? progressCallback,
  }) async {
    return _uploadImageImpl(
      img: img,
      productName: productName,
      folder: folder,
      publicID: publicID,
      progressCallback: progressCallback,
    );
  }

  static Future<Uint8List?> compressedImage({
    required ImageSource source,
    required int maxSize,
    required BuildContext context,
  }) async {
    return await _compressedImageImpl(
      source: source,
      maxSize: maxSize,
      context: context,
    );
  }

  static Future<void> delete({required String publicID}) async {
    return await _deleteImpl(publicID: publicID);
  }
}
