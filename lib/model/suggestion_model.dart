class SuggestionModel {
    SuggestionModel({
        required this.success,
        required this.message,
    });

    final bool? success;
    final String? message;

    factory SuggestionModel.fromJson(Map<String, dynamic> json){ 
        return SuggestionModel(
            success: json["success"],
            message: json["message"],
        );
    }

}
