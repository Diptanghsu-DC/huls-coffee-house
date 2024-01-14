part of '../user_controller.dart';

Future<UserModel?> _updateImpl() async {
  if (UserController.currentUser == null) {
    throw Exception("Please Login");
  }
  CollectionReference<Map<String, dynamic>> db =
  FirebaseFirestore.instance.collection(UserController._collectionName);


  Query query = db;


  query.limit(1);
  query = query.where(UserFields.email.name);


  QuerySnapshot querySnapshot = await query.get();
  if (querySnapshot.docs.isEmpty) {}

  List<UserModel> oldData = await UserController.get(
    email: UserController.currentUser!.email,
    forceGet: true,
  ).first;
  if (oldData.isEmpty) {
    throw Exception("Couldn't find user");
  } else {
    UserController.currentUser =
    (await UserController._save(user: UserController.currentUser))!;
    return UserController.currentUser;
  }
}
