class User {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final String? braceletId;
  final String? roleId;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.roleId = "2",
      this.braceletId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      email: json['user']['email'],
      phone: json['user']['phone'],
      password: json['user']['password'],
      roleId: json['user']['role_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'role_id': int.tryParse(roleId!),
        'bracelet_id': int.tryParse(braceletId!),
      };
}
