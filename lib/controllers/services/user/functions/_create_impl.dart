part of '../user_controller.dart';

Future<UserModel?> _createImpl(UserModel user) async {
  CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection(UserController._collectionName);

  await UserController._checkDuplicate(user);

  if (user.password.isEmpty) {
    throw Exception("Password cannot be empty");
  } else {
    user = user.copyWith(
      password: Encryptor.encrypt(
        user.password,
        dotenv.env[EnvValues.ENCRYPTER_SALT.name]!,
      ),
    );
    // await collection.insertOne(user.toJson());
    await db.add(user.toJson());
    UserController.currentUser = (await UserController.get(
      email: user.email,
      forceGet: true,
    ).first)
        .first;
    UserController.currentUser = await UserController._save();
    return UserController.currentUser;
  }
}
