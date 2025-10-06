// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../src/payload.dart';
import '../src/sms_generator.dart';
import '../src/sms_sender.dart';
import '../utils/pretty-json.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.post => _handlePost(context),
    _ => _handleNotPost(),
  };
}

Future<Response> _handleNotPost() async {
  return Response.json(
    statusCode: HttpStatus.methodNotAllowed,
    body: {
      'message': 'method not allowed',
    },
  );
}

Future<Response> _handlePost(RequestContext context) async {
  final body = await context.request.json() as Map<String, dynamic>;
  prettyJson(body);
  late final Payload _payload;
  late final String _sms;
  try {
    _payload = Payload.fromJson(body);
  } catch (e) {
    print('payload parsing error $e');
  }

  try {
    _sms = SmsGenerator(payload: _payload).generateSms();
  } catch (e) {
    print('sms generation error $e');
  }

  try {
    await SmsSender(sms: _sms, phone: '2${_payload.operation.phone}').sendSms();
  } catch (e) {
    print('sms sending failed $e');
  }

  //TODO: send notification to adding user that the notification message is sent to the patient

  return Response.json(
    body: {
      'message': 'ok',
    },
  );
}
