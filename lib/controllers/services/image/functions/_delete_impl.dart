part of '../image_controller.dart';

Future<void> _deleteImpl({required String publicID}) async {
  Cloudinary cloudinary = Cloudinary.signedConfig(
    apiKey: dotenv.env[EnvValues.CLOUDINARY_API_KEY.name]!,
    apiSecret: dotenv.env[EnvValues.CLOUDINARY_API_SECRET.name]!,
    cloudName: dotenv.env[EnvValues.CLOUDINARY_CLOUD_NAME.name]!,
  );
  await cloudinary.destroy(publicID);
}
