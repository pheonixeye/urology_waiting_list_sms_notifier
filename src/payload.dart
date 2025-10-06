import 'package:equatable/equatable.dart';

import '../models/operation_expanded.dart';

enum NotificationType {
  create,
  update;

  factory NotificationType.fromString(String value) {
    return switch (value) {
      'create' => create,
      'update' => update,
      _ => throw UnimplementedError(),
    };
  }
}

class Payload extends Equatable {
  const Payload({
    required this.type,
    required this.operation,
    this.newOperation,
  }) : isUpdate = newOperation != null;

  factory Payload.fromJson(Map<String, dynamic> map) {
    return Payload(
      type: NotificationType.fromString(map['type'] as String),
      operation:
          OperationExpanded.fromJson(map['operation'] as Map<String, dynamic>),
      newOperation: map['operation_new'] != null
          ? OperationExpanded.fromJson(
              map['operation_new'] as Map<String, dynamic>,
            )
          : null,
    );
  }
  final NotificationType type;
  final OperationExpanded operation;
  final OperationExpanded? newOperation;
  final bool isUpdate;

  @override
  List<Object?> get props => [
        type,
        operation,
        newOperation,
        isUpdate,
      ];
}
