class ForgotPasswordModel {
  ForgotPasswordModel({
    required this.success,
    required this.message,
    this.errors,
  });

  final bool? success;
  final String? message;
  final ForgotPasswordErrors? errors;

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    final dynamic rawMessage = json["message"];
    final dynamic rawErrors = json["errors"];

    final ForgotPasswordErrors? parsedErrors = rawErrors is Map<String, dynamic>
        ? ForgotPasswordErrors.fromJson(rawErrors)
        : rawMessage is Map<String, dynamic>
        ? ForgotPasswordErrors.fromJson(rawMessage)
        : null;

    return ForgotPasswordModel(
      success: json["success"],
      message: rawMessage is String ? rawMessage : null,
      errors: parsedErrors,
    );
  }
}

class ForgotPasswordErrors {
  ForgotPasswordErrors({required this.email});

  final List<String> email;

  factory ForgotPasswordErrors.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordErrors(
      email: json["email"] == null
          ? <String>[]
          : List<String>.from(json["email"].map((x) => x.toString())),
    );
  }
}
