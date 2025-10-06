// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class SmsSender {
  SmsSender({
    required this.sms,
    required this.phone,
  });

  final String sms;
  final String phone;

  final String _baseUrl = Platform.environment['SMS_API_URL'] ?? '';
  final String _username = Platform.environment['USERNAME'] ?? '';
  final String _password = Platform.environment['PASSWORD'] ?? '';
  final String _sendername = Platform.environment['SENDERNAME'] ?? '';

  Future<void> sendSms() async {
    if (_baseUrl.isEmpty) {
      return;
    }
    final _uri =
        // ignore: lines_longer_than_80_chars
        '$_baseUrl?username=$_username&password=$_password&sendername=$_sendername&mobiles=$phone&message=$sms';
    final _response = await http.get(
      Uri.parse(_uri),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': 'en-US',
      },
    );

    if (_response.statusCode != HttpStatus.ok) {
      print('failed sending sms request.');
      print(jsonDecode(_response.body));
    } else {
      final _result =
          (jsonDecode(_response.body) as List<dynamic>)[0]['type'] as String?;
      print(_result);
    }
  }
}
