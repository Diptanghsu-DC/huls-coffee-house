part of '../user_controller.dart';

Future<UserModel?> _saveImpl({UserModel? user}) async {
  // If the user provided is null it assumes that it wants to save the currentUser
  if (user == null) {
    user = UserController.currentUser;
    if (UserController.currentUser == null) {
      await LocalDatabase.deleteAll();
      return null;
    } else {
      UserController.currentUser =
          UserController.currentUser!.copyWith(lastLocalUpdate: DateTime.now());
      print("localdatabase set method");
      await LocalDatabase.set(
        LocalDocuments.currentUser.name,
        [jsonEncode(UserController.currentUser!.toJson())],
      );
      print("local database set method completed");
    }
  }
  user = user!.copyWith(lastLocalUpdate: DateTime.now());
  print("local database get method");
  List<String> data = LocalDatabase.get(LocalDocuments.users.name);
  print("local database get method completed");
  Map res = data.isEmpty ? {} : jsonDecode(data[0]);
  res[user.email] = user.toJson();
  print("local database set method");
  await LocalDatabase.set(
    LocalDocuments.users.name,
    [jsonEncode(res)],
  );
  print("local database set method completed, returning user");
  return user;
}
