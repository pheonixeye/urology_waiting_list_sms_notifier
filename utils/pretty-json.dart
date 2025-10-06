import 'dart:convert';

void prettyJson(Object? object) {
  final _json = const JsonEncoder.withIndent(' ').convert(object);
  print(_json);
}
