part of '../user_controller.dart';

Stream<UserModel?> _loginSilentlyImpl({required bool forceGet}) async* {
  List<String> userData = LocalDatabase.get(LocalDocuments.currentUser.name);
  if (userData.isEmpty) {
    yield null;
  } else {
    UserController.currentUser = UserModel.fromJson(
      Formatter.convertMapToMapStringDynamic(jsonDecode(userData[0]))!,
    );

    if (forceGet) {
      List<UserModel> user = await UserController.get(
        email: UserController.currentUser!.email,
        forceGet: forceGet,
      ).first;
      if (user.isNotEmpty) {
        UserController.currentUser = user.first;
      }
    }
    yield UserController.currentUser;

    CollectionReference<Map<String, dynamic>> db =
        FirebaseFirestore.instance.collection(UserController._collectionName);

    Query query = db;
    query = query.where(UserFields.email.name,
        isEqualTo: UserController.currentUser!.email);
    query = query.limit(1);

    QuerySnapshot querySnapshot = await query.get();

    if (querySnapshot.docs.isNotEmpty) {
      Map<String, dynamic> userData =
          querySnapshot.docs.first.data() as Map<String, dynamic>;
      UserModel user = UserModel.fromJson(userData);
      UserController.currentUser = await UserController._save(user: user);
      yield UserController.currentUser;
    }
  }
}
