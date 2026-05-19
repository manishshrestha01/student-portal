class StoreModel {
    StoreModel({
        required this.success,
        required this.message,
        required this.data,
    });

    final bool? success;
    final String? message;
    final Data? data;

    factory StoreModel.fromJson(Map<String, dynamic> json){ 
        return StoreModel(
            success: json["success"],
            message: json["message"],
            data: json["data"] == null ? null : Data.fromJson(json["data"]),
        );
    }

}

class Data {
    Data({
        required this.plan,
        required this.courseName,
        required this.status,
    });

    final String? plan;
    final String? courseName;
    final String? status;

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            plan: json["plan"],
            courseName: json["course_name"],
            status: json["status"],
        );
    }

}
