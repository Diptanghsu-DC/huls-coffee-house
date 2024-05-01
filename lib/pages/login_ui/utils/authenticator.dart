import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:huls_coffee_house/utils/database/constants.dart';

class Authenticator {
  Future<void> sendEmailOtp(String otp, String recipient, String phone) async {
    const String apiUrl = 'https://api.elasticemail.com/v2/email/send';
    final String emailVerAPI = dotenv.env["EMAIL_VERIFICATION_API"] ?? 'null';
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final bodyMap = {
      'apikey': emailVerAPI,
      'from': dotenv.env[EnvValues.SENDER_EMAIL.name],
      'to': recipient,
      'subject': "OTP for Email Verification",
      'body_html':
          "Dear user, your OTP for Campus 24 x 7 is $otp. Thank you for supporting Campus 24 x 7",
    };

    // try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: bodyMap,
    );

    if (response.statusCode == 200) {
      print('Email sent successfully');
    } else {
      print('Failed to send email. Status code: ${response.statusCode}');
    }
  }
}
