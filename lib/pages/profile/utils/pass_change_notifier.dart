import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:huls_coffee_house/utils/database/constants.dart';

class PassChangeNotifier {
  Future<void> sendEmailVer(String recipient) async {
    const String apiUrl = 'https://api.elasticemail.com/v2/email/send';
    final String emailVerAPI = dotenv.env["EMAIL_VERIFICATION_API"] ?? 'null';
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final bodyMap = {
      'apikey': emailVerAPI,
      'from': dotenv.env[EnvValues.SENDER_EMAIL.name],
      'to': recipient,
      'subject': "Password change alert",
      'body_html':
          "Dear user, your password for huls coffee house has been successfully changed. Thank you for supporting huls coffee house",
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
