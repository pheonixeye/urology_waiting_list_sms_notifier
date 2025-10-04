import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

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
  print(body);

  return Response.json(
    body: {
      'message': 'ok',
    },
  );
}
