part of '../user_controller.dart';

Future<void> _deleteImpl() async {
  CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection(UserController._collectionName);

  if (UserController.currentUser == null) {
    throw Exception("Please Login to your account");
  }
  if ((await UserController.get(
    email: UserController.currentUser!.email,
    forceGet: true,
  ).first)
      .isEmpty) {
    throw Exception("Couldn't find user");
  } else {
    Query query = db;
    query.limit(1);

    query = query.where(UserFields.email.name,
        isEqualTo: UserController.currentUser!.email);

    QuerySnapshot querySnapshot = await query.get();

    await querySnapshot.docs.first.reference.delete();

    await UserController.logOut();
  }
}
