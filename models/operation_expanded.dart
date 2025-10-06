// ignore_for_file: non_constant_identifier_names, avoid_dynamic_calls

import 'package:equatable/equatable.dart';
import 'package:pocketbase/pocketbase.dart';

import 'app_user.dart';
import 'doctor.dart';
import 'speciality.dart';

class OperationExpanded extends Equatable {
  const OperationExpanded({
    required this.id,
    required this.name,
    required this.rank,
    required this.phone,
    required this.diagnosis,
    required this.operation,
    required this.operative_date,
    required this.attended,
    required this.added_by,
    required this.consultant,
    required this.postponed,
  });

  factory OperationExpanded.fromJson(Map<String, dynamic> json) {
    return OperationExpanded(
      id: json['id'] as String,
      name: json['name'] as String,
      rank: json['rank'] as String,
      phone: json['phone'] as String,
      diagnosis: json['diagnosis'] as String,
      operation: json['operation'] as String,
      operative_date: DateTime.parse(json['operative_date'] as String),
      attended: json['attended'] as bool,
      added_by: AppUser(
        id: json['added_by']['id'] as String?,
        auth: null,
        speciality: Speciality(
          id: json['added_by']['speciality']['id'] as String,
          name: json['added_by']['speciality']['name'] as String,
        ),
        name: json['added_by']['name'] as String,
      ),
      consultant: Doctor(
        id: json['consultant']['id'] as String,
        name: json['consultant']['name'] as String,
        speciality: Speciality(
          id: json['consultant']['speciality']['id'] as String,
          name: json['consultant']['speciality']['name'] as String,
        ),
      ),
      postponed: json['postponed'] as num,
    );
  }

  factory OperationExpanded.fromRecordModel(RecordModel record) {
    return OperationExpanded(
      id: record.getStringValue('id'),
      name: record.getStringValue('name'),
      rank: record.getStringValue('rank'),
      phone: record.getStringValue('phone'),
      diagnosis: record.getStringValue('diagnosis'),
      operation: record.getStringValue('operation'),
      operative_date: DateTime.parse(record.getStringValue('operative_date')),
      attended: record.getBoolValue('attended'),
      added_by:
          AppUser.fromRecordModel(record.get<RecordModel>('expand.added_by')),
      consultant:
          Doctor.fromRecordModel(record.get<RecordModel>('expand.consultant')),
      postponed: record.getDoubleValue('postponed'),
    );
  }
  final String id;
  final String name;
  final String rank;
  final String phone;
  final String diagnosis;
  final String operation;
  final DateTime operative_date;
  final bool attended;
  final AppUser added_by;
  final Doctor consultant;
  final num postponed;

  OperationExpanded copyWith({
    String? id,
    String? name,
    String? rank,
    String? phone,
    String? diagnosis,
    String? operation,
    DateTime? operative_date,
    bool? attended,
    AppUser? added_by,
    Doctor? consultant,
    num? postponed,
  }) {
    return OperationExpanded(
      id: id ?? this.id,
      name: name ?? this.name,
      rank: rank ?? this.rank,
      phone: phone ?? this.phone,
      diagnosis: diagnosis ?? this.diagnosis,
      operation: operation ?? this.operation,
      operative_date: operative_date ?? this.operative_date,
      attended: attended ?? this.attended,
      added_by: added_by ?? this.added_by,
      consultant: consultant ?? this.consultant,
      postponed: postponed ?? this.postponed,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'rank': rank,
      'phone': phone,
      'diagnosis': diagnosis,
      'operation': operation,
      'operative_date': operative_date.toIso8601String(),
      'attended': attended,
      'added_by': added_by.toJson(),
      'consultant': consultant.toJson(),
      'postponed': postponed,
    };
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      rank,
      phone,
      diagnosis,
      operation,
      operative_date,
      attended,
      added_by,
      consultant,
      postponed,
    ];
  }
}


// {
//  "type": "update",
//  "operation_old": {
//   "id": "2iqoxmrfos21tp0",
//   "name": "محمد محمد محمد محمد",
//   "rank": "مجند",
//   "phone": "01008788385",
//   "diagnosis": "دوالي خصية يسري",
//   "operation": "ربط دوالي خصية يسري جراحة",
//   "operative_date": "2025-10-07T00:00:00.000Z",
//   "attended": false,
//   "added_by": {
//    "id": null,
//    "auth": null,
//    "speciality": {
//     "id": "xhgs0hmb263kfao",
//     "name": "مسالك بولية"
//    },
//    "name": "كريم زاهر"
//   },
//   "consultant": {
//    "id": "pm780kjfr70pkwg",
//    "name": "مراد محمود",
//    "speciality": {
//     "id": "xhgs0hmb263kfao",
//     "name": "مسالك بولية"
//    }
//   },
//   "postponed": 7
//  },
//  "operation_new": {
//   "id": "2iqoxmrfos21tp0",
//   "name": "محمد محمد محمد محمد",
//   "rank": "مجند",
//   "phone": "01008788385",
//   "diagnosis": "دوالي خصية يسري",
//   "operation": "ربط دوالي خصية يسري جراحة",
//   "operative_date": "2025-10-10T00:00:00.000Z",
//   "attended": false,
//   "added_by": {
//    "id": null,
//    "auth": null,
//    "speciality": {
//     "id": "xhgs0hmb263kfao",
//     "name": "مسالك بولية"
//    },
//    "name": "كريم زاهر"
//   },
//   "consultant": {
//    "id": "pm780kjfr70pkwg",
//    "name": "مراد محمود",
//    "speciality": {
//     "id": "xhgs0hmb263kfao",
//     "name": "مسالك بولية"
//    }
//   },
//   "postponed": 8
//  }
// }