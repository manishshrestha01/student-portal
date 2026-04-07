class TicketModel {
  TicketModel({required this.success, required this.data});

  final bool? success;
  final List<Datum> data;

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> ticketList = _extractTicketList(json);
    return TicketModel(
      success: json["success"] == true,
      data: ticketList
          .whereType<Map<String, dynamic>>()
          .map(Datum.fromJson)
          .toList(),
    );
  }

  static List<dynamic> _extractTicketList(Map<String, dynamic> json) {
    final dynamic directData = json["data"];
    if (directData is List) {
      return directData;
    }

    final dynamic tickets = json["tickets"];
    if (tickets is List) {
      return tickets;
    }

    if (directData is Map<String, dynamic>) {
      final dynamic nestedTickets = directData["tickets"];
      if (nestedTickets is List) {
        return nestedTickets;
      }

      final dynamic nestedData = directData["data"];
      if (nestedData is List) {
        return nestedData;
      }
    }

    return [];
  }
}

class Datum {
  Datum({
    required this.category,
    required this.subject,
    required this.description,
    required this.status,
  });

  final String? category;
  final String? subject;
  final String? description;
  final String? status;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      category: _valueToText(
        json["category"] ?? json["ticket_category"] ?? json["type"],
      ),
      subject: _valueToText(json["subject"] ?? json["title"]),
      description: _valueToText(
        json["description"] ?? json["message"] ?? json["body"],
      ),
      status: _valueToText(json["status"] ?? json["ticket_status"]),
    );
  }

  static String? _valueToText(dynamic value) {
    if (value == null) {
      return null;
    }
    if (value is String) {
      return value;
    }
    if (value is num || value is bool) {
      return value.toString();
    }
    if (value is Map<String, dynamic>) {
      const keys = ["name", "title", "label", "status", "category"];
      for (final key in keys) {
        final dynamic nestedValue = value[key];
        if (nestedValue is String && nestedValue.trim().isNotEmpty) {
          return nestedValue;
        }
      }
      return value.toString();
    }
    return value.toString();
  }
}
