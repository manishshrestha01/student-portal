class UpdateProfileModel {
  UpdateProfileModel({required this.success, required this.message});

  final bool? success;
  final String? message;

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      success: json["success"],
      message: json["message"],
    );
  }
}
