class User {
  final String name;
  final String email;
  final String password;
  final String braceletId;
  final String relativeTie;

  User(
      {required this.name,
      required this.email,
      required this.password,
      required this.relativeTie,
      required this.braceletId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      relativeTie: json['relativeTie'],
      braceletId: json['braceletId'],
    );
  }
}
