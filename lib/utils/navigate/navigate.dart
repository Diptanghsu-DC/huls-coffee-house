import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/profile/profile_main.dart';

class Navigate {
  static void toProfilePage(BuildContext context){
    Navigator.pushNamed(context, ProfilePage.routeName);
  }
}
