import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_email_sender/flutter_email_sender.dart';

class Authenticator {
  Future<void> sendEmailOtp(String otp, String recipient, String phone) async {
    const String apiUrl = 'https://api.elasticemail.com/v2/email/send';
    final String emailVerAPI = dotenv.env["EMAIL_VERIFICATION_API"] ?? 'null';
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final bodyMap = {
      'apikey': emailVerAPI,
      'from': "diptangshu1617@gmail.com",
      'to': recipient,
      'subject': "OTP for Email Verification",
      'body_html':
          "Dear user, your otp for huls coffee house is $otp. Please also verify the mobile number entered $phone",
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
