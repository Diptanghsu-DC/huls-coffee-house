part of '../image_controller.dart';

Future<UploadInformation> _uploadImageImpl({
  required Uint8List img,
  String? productName,
  String? publicID,
  required ImageFolder folder,
  void Function(int count, int total)? progressCallback,
}) async {
  if (productName == null) {
    throw Exception("product name is required");
  }
  String fileName = "";
  if (folder == ImageFolder.productImage) {
    fileName = productName;
  }

  Cloudinary cloudinary = Cloudinary.signedConfig(
    apiKey: dotenv.env["CLOUDINARY_API_KEY"]!,
    apiSecret: dotenv.env["CLOUDINARY_API_SECRET"]!,
    cloudName: dotenv.env["CLOUDINARY_CLOUD_NAME"]!,
  );
  if (publicID != null) {
    await cloudinary.destroy(publicID);
  }

  CloudinaryResponse response = await cloudinary.upload(
    fileBytes: img.toList(),
    resourceType: CloudinaryResourceType.image,
    folder: folder.name,
    fileName: '${fileName}_${DateTime.now().millisecondsSinceEpoch}',
    progressCallback: progressCallback,
  );

  print("upload successful");

  if (response.isSuccessful && response.secureUrl != null) {
    return UploadInformation(
      url: response.secureUrl!,
      publicID: response.publicId,
    );
  } else {
    throw Exception("Couldn't upload image");
  }
}
