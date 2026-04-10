class LogoutModel {
  LogoutModel({required this.success, required this.message});

  final bool? success;
  final String? message;

  factory LogoutModel.fromJson(Map<String, dynamic> json) {
    return LogoutModel(success: json["success"], message: json["message"]);
  }
}
