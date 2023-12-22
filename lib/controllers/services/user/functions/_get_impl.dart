part of '../user_controller.dart';

Stream<List<UserModel>> _getImpl({
  required String email,
  String? id,
  String? nameStartsWith,
  bool keepPassword = false,
  bool forceGet = false,
}) async* {
  print("entering fetchLocal...");
  List<UserModel> filteredModels = await _fetchLocal(
    email: email,
    id: id,
    nameStartsWith: nameStartsWith,
    keepPassword: keepPassword,
    forceGet: forceGet,
  );
  if (filteredModels.isNotEmpty) yield filteredModels;

  print("entering fetch from backend...");
  filteredModels = await _fetchFromBackend(
    email: email,
    id: id,
    nameStartsWith: nameStartsWith,
    keepPassword: keepPassword,
    forceGet: forceGet,
  );
  yield filteredModels;
}

Future<List<UserModel>> _fetchLocal({
  String? email,
  String? id,
  String? nameStartsWith,
  bool keepPassword = false,
  bool forceGet = false,
}) async {
  List<UserModel> filteredUsers = [];
  if (forceGet) {
    print("local database deeletekey method");
    await LocalDatabase.deleteKey(LocalDocuments.users.name);
  } else if (keepPassword == false) {
    // Since passwords are never stored in the local database
    print("local database get method");
    List<String> data = LocalDatabase.get(LocalDocuments.users.name);
    print("local database get method completed");
    if (data.isNotEmpty) {
      Map users = jsonDecode(data[0]);
      if (email != null) {
        if (users.containsKey(email)) {
          UserModel user = UserModel.fromJson(
            Formatter.convertMapToMapStringDynamic(users[email])!,
          );
          // if (user.app == appName) {
          filteredUsers.add(user);
          // }
        }
      } else if (nameStartsWith != null) {
        for (dynamic user in users.values) {
          if (user != null &&
              (user[UserFields.name.name] as String)
                  .toLowerCase()
                  .startsWith(nameStartsWith.toLowerCase())) {
            filteredUsers.add(UserModel.fromJson(
              Formatter.convertMapToMapStringDynamic(user)!,
            ));
          }
        }
      } else if (id != null) {
        for (dynamic user in users.values) {
          if (user != null && user["id"] == id.toString()) {
            filteredUsers.add(UserModel.fromJson(
              Formatter.convertMapToMapStringDynamic(user)!,
            ));
            break;
          }
        }
      }
    }
  }
  print("local fetching completed");
  return filteredUsers;
}

Future<List<UserModel>> _fetchFromBackend({
  required String email,
  String? id,
  String? nameStartsWith,
  bool keepPassword = false,
  bool forceGet = false,
}) async {
  // Backend
  CollectionReference<Map<String, dynamic>> db =
      FirebaseFirestore.instance.collection(UserController._collectionName);

  print("database initialization done");
  print("setting query...");

  Query query = db;

  print("query set");

  query.limit(1);
  query = query.where(UserFields.email.name, isEqualTo: email);

  print("query filtering done");

  QuerySnapshot querySnapshot = await query.get();

  print("query snapshot created");

  List<UserModel> users = [];

  if (querySnapshot.docs.isEmpty) {
    print("query found empty, returing users...");
    return users;
  }

  List<Map<String, dynamic>> res = [
    querySnapshot.docs.first.data() as Map<String, dynamic>
  ];

  print("List of user created");
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
  print("returning the user");
  return users;
}
