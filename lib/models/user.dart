import 'package:pap/enums/roles.dart';
import 'package:pap/models/bracelet.dart';

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final Bracelet? bracelet;
  final Roles? roleId;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.roleId,
      this.bracelet});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      email: json['user']['email'],
      phone: json['user']['phone'],
      password: json['user']['password'],
      roleId: json['user']['role_id'] != null
          ? Roles.values[json['user']['role_id']]
          : null,
      bracelet: json['bracelet'] != "No Bracelet yet"
          ? Bracelet.fromJson(json['bracelet'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'role_id': roleId,
      };
}
