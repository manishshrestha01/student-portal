class AdmissionModel {
    AdmissionModel({
        required this.success,
        required this.message,
    });

    final bool? success;
    final String? message;

    factory AdmissionModel.fromJson(Map<String, dynamic> json){ 
        return AdmissionModel(
            success: json["success"],
            message: json["message"],
        );
    }

}
