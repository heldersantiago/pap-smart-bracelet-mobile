class RegisterError{
  final String? name;
  final String? errors;
  RegisterError({this.name,this.errors});

  factory RegisterError.fromJson(Map<String, dynamic> json) {
    return RegisterError(
      name: json['name'],
      errors: json['errors'],
    );
  }
}