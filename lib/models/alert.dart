import 'dart:ffi';

import 'package:pap/models/bracelet.dart';

class Alert {
  final int? id;
  final String? title;
  final String? description;
  final String? type;
  final bool? isActive;
  final int? braceletId;
  final String? createdAt;
  final String? updatedAt;

  Alert({
    this.id,
    this.title,
    this.description,
    this.type,
    this.isActive,
    this.braceletId,
    this.createdAt,
    this.updatedAt,
  });

  factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      type: json['type'],
      isActive: json['isActive'],
      braceletId: json['braceletId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

// Map<String, dynamic> toJson() => {
//   'name': name,
//   'email': email,
//   'phone': phone,
//   'password': password,
//   'role_id': roleId,
// };
}
