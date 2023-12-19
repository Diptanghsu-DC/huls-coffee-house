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
      await LocalDatabase.set(
        LocalDocuments.currentUser.name,
        [jsonEncode(UserController.currentUser!.toJson())],
      );
    }
  }
  user = user!.copyWith(lastLocalUpdate: DateTime.now());
  List<String> data = LocalDatabase.get(LocalDocuments.users.name);
  Map res = data.isEmpty ? {} : jsonDecode(data[0]);
  res[user.email] = user.toJson();
  await LocalDatabase.set(
    LocalDocuments.users.name,
    [jsonEncode(res)],
  );
  return user;
}
