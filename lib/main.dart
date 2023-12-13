import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/pages.dart';
import 'package:huls_coffee_house/pages/view_product_page/test.dart';
import 'package:huls_coffee_house/pages/view_product_page/viewall.dart';
import 'package:huls_coffee_house/pages/view_product_page/viewproduct.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Homepage.routeName: (context) => const Homepage(),
        LoginPage.routeName: (context) => const LoginPage(),
       // ViewProduct.routeName:(context) => const ViewProduct(),//formeanwhile commented
        ViewAll.routeName:(context) => const ViewAll(),
        Test.routeName:(context) => const Test(),
        

      },
      initialRoute: ViewAll.routeName,
    );
  }
}
