import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@Freezed()
class UserModel with _$UserModel {
  const factory UserModel({
    required String name,
    required String email,
    required String password,
    @Default(false) bool isSeller,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

UserModel minifiedFromJson(Map<String, dynamic> json) =>
    UserModel(name: json[UserFields.name.name], email: "", password: "");

enum UserFields { name, email, password, isSeller, lastLocalUpdate }
