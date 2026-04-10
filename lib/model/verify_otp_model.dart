class VerifyOtpModel {
  VerifyOtpModel({required this.success, required this.message});

  final bool? success;
  final String? message;

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    final dynamic rawSuccess = json["success"];
    final dynamic rawMessage = json["message"];
    final dynamic rawErrors = json["errors"];

    String? parsedMessage;

    if (rawMessage is String) {
      parsedMessage = rawMessage;
    } else if (rawMessage is Map<String, dynamic>) {
      for (final value in rawMessage.values) {
        if (value is List && value.isNotEmpty) {
          parsedMessage = value.first.toString();
          break;
        }
        if (value is String && value.isNotEmpty) {
          parsedMessage = value;
          break;
        }
      }
    } else if (rawErrors is Map<String, dynamic>) {
      for (final value in rawErrors.values) {
        if (value is List && value.isNotEmpty) {
          parsedMessage = value.first.toString();
          break;
        }
        if (value is String && value.isNotEmpty) {
          parsedMessage = value;
          break;
        }
      }
    }

    return VerifyOtpModel(
      success: rawSuccess is bool
          ? rawSuccess
          : rawSuccess is int
          ? rawSuccess == 1
          : rawSuccess is String
          ? rawSuccess.toLowerCase() == 'true' || rawSuccess == '1'
          : null,
      message: parsedMessage,
    );
  }
}
