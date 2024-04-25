import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/utils/screen_size.dart';

class PrivacyPolicyPage extends StatelessWidget {
  static const String routeName = '/PrivacyPolicyPage';

  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const GoBackButton(),
        title: const Text('Privacy Policy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Privacy Policy for Campus Need App',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Last Updated: 24 April, 2024', //date to be updated later
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Thank you for choosing Campus Need, your trusted online grocery and fast-food selling app. This Privacy Policy is designed to help you understand how we collect, use, disclose, and safeguard your personal information when you use our mobile application and services. Please take a moment to review this policy and contact us if you have any questions or concerns.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              const SizedBox(height: 16),
              const Text(
                '1. Information We Collect:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'a. Personal Information:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                '- When you create an account, we may collect your name, email address, phone number, and delivery address.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              const SizedBox(height: 8),
              const Text(
                'b. Usage Information:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                '- We collect information about your interactions with our app, such as the pages or products you view, your searches, and other activities.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              const SizedBox(height: 8),
              const Text(
                'c. Device Information:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                '- We may collect information about your device, including its unique device identifier, IP address, operating system, and mobile network information.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              const SizedBox(height: 16),
              const Text(
                '2. How We Use Your Information:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'a. Order Processing:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                '- We use your personal information to process and fulfill your orders, communicate with you about your orders, and provide customer support.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              const SizedBox(height: 8),
              const Text(
                'b. Personalization:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                '- We use your information to personalize your shopping experience, recommend products, and show you relevant content.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              const SizedBox(height: 8),
              const Text(
                'c. Communication:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                '- With your consent, we may send you promotional emails or messages about new products, offers, and updates.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              const SizedBox(height: 16),
              const Text(
                '3. Sharing Your Information:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'a. Third-Party Service Providers:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                '- We may share your information with third-party service providers who assist us in delivering our services, such as payment processors, delivery partners, and marketing agencies.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              const SizedBox(height: 8),
              const Text(
                'b. Legal Compliance:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                '- We may disclose your information if required by law or in response to a valid legal request.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              const SizedBox(height: 16),
              const Text(
                '4. Security:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                '- We implement industry-standard security measures to protect your information from unauthorized access, disclosure, alteration, and destruction.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              const SizedBox(height: 16),
              const Text(
                '5. Your Choices:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                '- You can manage your communication preferences, update your account information, and control the information you share through your account settings.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              const SizedBox(height: 16),
              const Text(
                '6. Children’s Privacy:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                '- Our services are not intended for individuals under the age of 13. We do not knowingly collect personal information from children.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              const SizedBox(height: 16),
              const Text(
                '7. Changes to this Privacy Policy:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                '- We may update this Privacy Policy to reflect changes in our practices. We will notify you of any material changes by posting the updated policy on our app.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              const SizedBox(height: 16),
              const Text(
                '8. Contact Us:',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'If you have any questions or concerns about this Privacy Policy or our practices, please contact us at seensaseedbond64@gmail.com.',
                style: TextStyle(fontFamily: 'SofiaPro'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Thank you for choosing HUL COFFEE HOUSE!',
                style: TextStyle(
                    fontFamily: 'SofiaPro',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: width,
                child: Column(
                  children: [
                    const Text(
                      "Developed by",
                      style: TextStyle(fontFamily: 'SofiaPro'),
                    ),
                    Image.asset(
                      "assets/images/ecell_logo.png",
                      height: 100,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
