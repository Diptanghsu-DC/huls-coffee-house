part of '../user_controller.dart';

Future<void> _updateImpl({
  UserModel? oldUser,
}) async {
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

    Map<String, dynamic> newData = {
      "name": UserController.currentUser!.name,
      "email": UserController.currentUser!.email,
      "phone": UserController.currentUser!.phone,
      "password": oldUser.password == UserController.currentUser!.password
          ? oldUser.password
          : Encryptor.encrypt(
              UserController.currentUser!.password,
              dotenv.env[EnvValues.ENCRYPTER_SALT.name]!,
            ),
    };

    document.update(newData);
    await UserController._save(user: UserController.currentUser);
  }
}
