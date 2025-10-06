import 'package:equatable/equatable.dart';

class Speciality extends Equatable {
  const Speciality({
    required this.id,
    required this.name,
  });

  factory Speciality.fromJson(Map<String, dynamic> map) {
    return Speciality(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }
  final String id;
  final String name;

  Speciality copyWith({
    String? id,
    String? name,
  }) {
    return Speciality(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name];
}
