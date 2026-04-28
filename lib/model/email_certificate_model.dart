class EmailCertificatesModel {
    EmailCertificatesModel({
        required this.success,
        required this.message,
    });

    final bool? success;
    final String? message;

    factory EmailCertificatesModel.fromJson(Map<String, dynamic> json){ 
        return EmailCertificatesModel(
            success: json["success"],
            message: json["message"],
        );
    }

}
