part of '../user_controller.dart';

Future<List<UserModel>> _getAdminImpl() async {
  // Backend
  CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection(UserController._collectionName);

  // print("database initialization done");
  // print("setting query...");

  Query query = collection;

  // print("query set");

  // query.limit(1);
  query = query.where(UserFields.isSeller.name, isEqualTo: true);

  // print("query filtering done");

  QuerySnapshot querySnapshot = await query.get();

  print("query snapshot created");

  List<UserModel> users = [];

  if (querySnapshot.docs.isEmpty) {
    print("query found empty, returing users...");
    return users;
  }

  List<Map<String, dynamic>> res = querySnapshot.docs
      .map((doc) => doc.data() as Map<String, dynamic>)
      .toList();

  // print("List of user created");
  // await db.find(selectorBuilder).toList();
  for (Map<String, dynamic> userData in res) {
    UserModel user = UserModel.fromJson(userData);
    String password;
    // if (keepPassword) {
    password = user.password;
    // }
    user = (await UserController._save(user: user))!;
    users.add(user.copyWith(password: password));
  }
  // print("returning the user");
  return users;
}
