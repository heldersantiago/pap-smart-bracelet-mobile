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
      this.relativeTie,
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
}
