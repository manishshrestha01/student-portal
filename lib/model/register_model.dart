class RegisterModel {
  RegisterModel({required this.success, required this.errors});

  final bool? success;
  final Errors? errors;

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      success: json["success"],
      errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
    );
  }
}

class Errors {
  Errors({required this.email});

  final List<String> email;

  factory Errors.fromJson(Map<String, dynamic> json) {
    return Errors(
      email: json["email"] == null
          ? []
          : List<String>.from(json["email"]!.map((x) => x)),
    );
  }
}
