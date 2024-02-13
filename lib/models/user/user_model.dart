import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:huls_coffee_house/models/models.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@Freezed()
class UserModel with _$UserModel {
  const factory UserModel({
    String? deviceToken,
    required String name,
    required String email,
    required String password,
    required num phone,
    required String address,
    @Default(false) bool isSeller,
    @Default(false) bool newNotification,
    DateTime? lastLocalUpdate,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

UserModel minifiedFromJson(Map<String, dynamic> json) => UserModel(
    name: json[UserFields.name.name],
    email: "",
    password: "",
    address: "",
    phone: json[UserFields.phone.name]);

enum UserFields {
  deviceToken,
  name,
  email,
  password,
  phone,
  address,
  isSeller,
  lastLocalUpdate
}
