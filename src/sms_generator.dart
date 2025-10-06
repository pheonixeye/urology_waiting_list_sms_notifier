import 'package:intl/intl.dart';

import 'payload.dart';

class SmsGenerator {
  SmsGenerator({required this.payload});

  final Payload payload;

  String generateSms() {
    return switch (payload.type) {
      NotificationType.create => '''
قسم جراحة المسالك البولية
المجمع الطبي بالرحاب
تم تحديد موعد عملية باسم
(${payload.operation.name})
يوم (${DateFormat('EEEE', 'ar').format(payload.operation.operative_date)})
الموافق (${DateFormat('dd/MM/yyyy', 'ar').format(payload.operation.operative_date)})
برجاء الحضور في اليوم السابق للعملية التاسعة صباحا لاتمام اجرائات الحجز
''',
      NotificationType.update => '''
قسم جراحة المسالك البولية
المجمع الطبي بالرحاب
تم تعديل موعد عملية باسم
(${payload.operation.name})
يوم (${DateFormat('EEEE', 'ar').format(payload.newOperation!.operative_date)})
الموافق (${DateFormat('dd/MM/yyyy', 'ar').format(payload.newOperation!.operative_date)})
 بدلا من الموعد السابق بتاريخ
(${DateFormat('dd/MM/yyyy', 'ar').format(payload.operation.operative_date)})
برجاء الحضور في اليوم السابق للعملية التاسعة صباحا لاتمام اجرائات الحجز
''',
    };
  }
}
