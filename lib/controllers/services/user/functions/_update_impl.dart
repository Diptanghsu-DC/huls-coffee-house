part of '../user_controller.dart';

Future<void> _updateImpl({UserModel? oldUser, UserModel? newUser}) async {
  if (UserController.currentUser == null || oldUser == null) {
    throw Exception("Some unexpected error occured. Please contact developers");
  }
  CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection(UserController._collectionName);

  Query query = collection;

  query.limit(1);
  query = query.where(UserFields.email.name, isEqualTo: oldUser.email);

  QuerySnapshot querySnapshot = await query.get();

  if (querySnapshot.docs.isEmpty) {
  } else {
    final documentId = querySnapshot.docs.first.id;

    final document = collection.doc(documentId);

    final updateUser = newUser ?? UserController.currentUser;

    Map<String, dynamic> newData = {
      "deviceToken": updateUser!.deviceToken,
      "name": updateUser.name,
      "email": updateUser.email,
      "phone": updateUser.phone,
      "password": oldUser.password == updateUser.password
          ? oldUser.password
          : Encryptor.encrypt(
              updateUser.password,
              dotenv.env[EnvValues.ENCRYPTER_SALT.name]!,
            ),
      "newNotification": updateUser.newNotification,
    };

    document.update(newData);
    await UserController._save(user: UserController.currentUser);
  }
}
