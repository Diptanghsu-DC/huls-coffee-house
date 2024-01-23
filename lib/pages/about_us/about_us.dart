import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';

class AboutUsPage extends StatelessWidget {
  static const String routeName = 'AbousUsPage';

  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const GoBackButton(),
        centerTitle: true,
        title: const Text('About Us'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Us - HUL COFFEE HOUSE',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Welcome to HUL COFFEE HOUSE, your go-to destination for a seamless blend of convenience and quality in the world of online grocery shopping and fast-food indulgence. Established locally in the vibrant community of NIT SILCHAR, we take pride in bringing you an extensive range of products and delectable treats right to your doorstep.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              SizedBox(height: 16),
              Text(
                'Our Mission:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'At HUL COFFEE HOUSE, our mission is to redefine your shopping and dining experience by offering a diverse and carefully curated selection of groceries and fast-food items. We are committed to making your life easier and more enjoyable by providing a one-stop platform that caters to your daily essentials and culinary cravings.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              SizedBox(height: 16),
              Text(
                'What Sets Us Apart:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '1. Local Roots, Global Vision:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'We are deeply rooted in the local community of NIT SILCHAR, and we understand the unique preferences and needs of our customers. Our vision extends globally as we strive to bring you the best products and flavors from around the world.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              SizedBox(height: 8),
              Text(
                '2. Quality Assurance:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'We are dedicated to delivering products of the highest quality. Whether it\'s fresh produce, pantry staples, or mouthwatering fast-food options, we ensure that every item meets our stringent quality standards.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              SizedBox(height: 8),
              Text(
                '3. Convenience Redefined:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Say goodbye to long queues and time-consuming grocery shopping. With HUL COFFEE HOUSE, you can shop for your favorite products and enjoy delicious meals with just a few taps on your mobile device.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              SizedBox(height: 8),
              Text(
                '4. Customer-Centric Approach:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Your satisfaction is our priority. Our customer support team is always ready to assist you with any queries or concerns. We value your feedback and continuously strive to enhance your overall experience.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              SizedBox(height: 16),
              Text(
                'Our Offerings:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '1. Grocery Shopping Made Easy:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Explore our extensive range of daily groceries, including fresh produce, pantry staples, beverages, and more. We source products from trusted suppliers to ensure you get the best quality every time.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              SizedBox(height: 8),
              Text(
                '2. Fast-Food Delights:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Indulge your taste buds with our tempting fast-food offerings. From quick bites to hearty meals, our menu is crafted to cater to diverse palates, ensuring there\'s something for everyone.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              SizedBox(height: 16),
              Text(
                'Join the HUL COFFEE HOUSE Community:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'We invite you to join our growing community of satisfied customers who have embraced the ease and joy of shopping and dining with HUL COFFEE HOUSE. Whether you\'re a busy professional, a student, or a homemaker, we have something special for you.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              SizedBox(height: 16),
              Text(
                'Thank you for choosing HUL COFFEE HOUSE – where convenience meets quality, and every purchase is an experience. Happy shopping and dining!',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
