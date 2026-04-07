class SupportTicketModel {
    SupportTicketModel({
        required this.success,
        required this.message,
    });

    final bool? success;
    final String? message;

    factory SupportTicketModel.fromJson(Map<String, dynamic> json){ 
        return SupportTicketModel(
            success: json["success"],
            message: json["message"],
        );
    }

}
