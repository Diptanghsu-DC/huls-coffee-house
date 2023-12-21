part of '../user_controller.dart';

Future<UserModel?> _createImpl(UserModel user) async {
  CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection(UserController._collectionName);

  print("checking duplicate user...");
  await UserController._checkDuplicate(user);
  print("duplicate user check done");

  if (user.password.isEmpty) {
    throw Exception("Password cannot be empty");
  } else {
    print("initializing password encryption");
    user = user.copyWith(
      password: Encryptor.encrypt(
        user.password,
        dotenv.env[EnvValues.ENCRYPTER_SALT.name]!,
      ),
    );
    print("password encryption completed");
    // await collection.insertOne(user.toJson());
    print("initializing data creationg");
    DocumentReference<Map<String, dynamic>> documentReference =
        await collection.add(user.toJson());

    print("data creation done");

    print("document created with ID: ${documentReference.id}");

    print("entering get method");
    UserController.currentUser = (await UserController.get(
      email: user.email,
      forceGet: true,
    ).first)
        .first;
    print("get method execution completed");
    print("entering save method...");
    UserController.currentUser = await UserController._save();
    print("save method completed, returning user...");
    return UserController.currentUser;
  }
}
