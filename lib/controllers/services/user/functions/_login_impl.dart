part of '../user_controller.dart';

Future<UserModel?> _loginImpl({
  required String email,
  required String password,
}) async {
  List<UserModel> user = await UserController.get(
    email: email,
    keepPassword: true,
    forceGet: true,
  ).first;
  if (user.isEmpty) {
    throw Exception("Couldn't find user. Please Sign up");
  } else {
    if (!Encryptor.isValid(user.first.password, password)) {
      throw Exception("Invalid password");
    }
    UserController.currentUser = user.first;
    UserController.currentUser = await UserController._save();
    return UserController.currentUser;
  }
}
