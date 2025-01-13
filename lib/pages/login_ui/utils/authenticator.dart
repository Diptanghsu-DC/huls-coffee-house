import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:huls_coffee_house/utils/database/constants.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class Authenticator {
  Future<void> sendEmailOtp(String otp, String recipient, String phone) async {
    String username = dotenv.env[EnvValues.SENDER_EMAIL.name]!;
    String password = dotenv.env[EnvValues.SENDER_EMAIL_PASSWORD.name]!;

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'CAMPUS 24 x 7')
      ..recipients.add(recipient)
      ..subject = 'OTP for Email Verification'
      ..text =
          'Dear user, your OTP for Campus 24 x 7 is $otp. Thank you for supporting Campus 24 x 7.';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent. $e');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
