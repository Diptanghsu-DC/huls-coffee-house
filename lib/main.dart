import 'package:firebase_core/firebase_core.dart';
import 'package:huls_coffee_house/pages/checkout_page/checkout_page.dart';
import 'package:huls_coffee_house/pages/login_ui/signup_page.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/pages.dart';
import 'package:huls_coffee_house/pages/view_product_page/test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:huls_coffee_house/utils/local_database/local_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocalDatabase.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme:
              const TextTheme(bodySmall: TextStyle(fontFamily: 'SofiaPro'))),
      routes: {
        Homepage.routeName: (context) => const Homepage(),
        LoginPage.routeName: (context) => const LoginPage(),
        SignupPage.routeName: (context) => const SignupPage(),
        ViewAll.routeName: (context) => const ViewAll(),
        Test.routeName: (context) => const Test(),
        Cart.routeName: (context) => const Cart(),
        OtpVerificationPage.routeName: (context) => const OtpVerificationPage(),
        CheckoutPage.routeName: (context) => const CheckoutPage()
      },
      initialRoute: CheckoutPage.routeName//LoginPage.routeName,
    );
  }
}
