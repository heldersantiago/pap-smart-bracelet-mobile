class User {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? braceletId;
  final String? relativeTie;
  User(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.relativeTie = "1",
      this.braceletId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      relativeTie: json['relativeTie'],
      braceletId: json['braceletId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'relative_tie': int.tryParse(relativeTie!),
        'bracelet_id': int.tryParse(braceletId!),
      };
}
