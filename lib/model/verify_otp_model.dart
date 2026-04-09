class VerifyOtpModel {
    VerifyOtpModel({
        required this.success,
        required this.message,
    });

    final bool? success;
    final String? message;

    factory VerifyOtpModel.fromJson(Map<String, dynamic> json){ 
        return VerifyOtpModel(
            success: json["success"],
            message: json["message"],
        );
    }

}
