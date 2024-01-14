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
    // } catch (e) {
    //   print('Error sending email: $e');
    // }
    // final apiUrl = 'https://api.sendgrid.com/v3/mail/send';

    // final headers = {
    //   'Content-Type': 'application/json',
    //   'Authorization': 'Bearer $sendgridApiKey',
    // };

    // final body = jsonEncode({
    //   'personalizations': [
    //     {'to': [{'email': recipient}]}
    //   ],
    //   'subject': 'Your OTP Code',
    //   'content': [
    //     {'type': 'text/plain', 'value': 'Your OTP Code is: $otp'}
    //   ],
    //   'from': {'email': 'your-email@example.com'},
    // });

    // try {
    //   final response = await http.post(Uri.parse(apiUrl), headers: headers, body: body);

    //   if (response.statusCode == 202) {
    //     print('OTP email sent successfully');
    //   } else {
    //     print('Failed to send OTP email. Status code: ${response.statusCode}');
    //   }
    // } catch (e) {
    //   print('Error sending OTP email: $e');
    // }
    // final Email email = Email(
    //   subject: "OTP for Email Verification",
    //   body:
    //       "Your OTP for signing in to Huls Coffee House is $otp. Please confirm that your phone number is $phone",
    //   recipients: [recipent],
    // );
    // String platformResponse;

    // // try {
    // await FlutterEmailSender.send(email);
    // platformResponse = 'Success';
    // } catch (error) {
    //   print(error);
    //   platformResponse = error.toString();
    // }
  }
}
