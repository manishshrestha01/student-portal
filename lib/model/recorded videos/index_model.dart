class IndexModel {
    IndexModel({
        required this.success,
        required this.message,
        required this.data,
    });

    final bool? success;
    final String? message;
    final Data? data;

    factory IndexModel.fromJson(Map<String, dynamic> json){ 
        return IndexModel(
            success: json["success"],
            message: json["message"],
            data: json["data"] == null ? null : Data.fromJson(json["data"]),
        );
    }

}

class Data {
    Data({
        required this.course,
        required this.terms,
    });

    final Course? course;
    final Terms? terms;

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            course: json["course"] == null ? null : Course.fromJson(json["course"]),
            terms: json["terms"] == null ? null : Terms.fromJson(json["terms"]),
        );
    }

}

class Course {
    Course({
        required this.id,
        required this.name,
        required this.slug,
        required this.subHeading,
        required this.thumbnail,
        required this.plans,
        required this.paymentInfo,
    });

    final int? id;
    final String? name;
    final String? slug;
    final String? subHeading;
    final String? thumbnail;
    final List<Plan> plans;
    final PaymentInfo? paymentInfo;

    factory Course.fromJson(Map<String, dynamic> json){ 
        return Course(
            id: json["id"],
            name: json["name"],
            slug: json["slug"],
            subHeading: json["sub_heading"],
            thumbnail: json["thumbnail"],
            plans: json["plans"] == null ? [] : List<Plan>.from(json["plans"]!.map((x) => Plan.fromJson(x))),
            paymentInfo: json["payment_info"] == null ? null : PaymentInfo.fromJson(json["payment_info"]),
        );
    }

}

class PaymentInfo {
    PaymentInfo({
        required this.esewaQr,
        required this.fonepayLogo,
        required this.bank,
    });

    final String? esewaQr;
    final String? fonepayLogo;
    final Bank? bank;

    factory PaymentInfo.fromJson(Map<String, dynamic> json){ 
        return PaymentInfo(
            esewaQr: json["esewa_qr"],
            fonepayLogo: json["fonepay_logo"],
            bank: json["bank"] == null ? null : Bank.fromJson(json["bank"]),
        );
    }

}

class Bank {
    Bank({
        required this.name,
        required this.accountName,
        required this.accountNumber,
        required this.branch,
    });

    final String? name;
    final String? accountName;
    final String? accountNumber;
    final String? branch;

    factory Bank.fromJson(Map<String, dynamic> json){ 
        return Bank(
            name: json["name"],
            accountName: json["account_name"],
            accountNumber: json["account_number"],
            branch: json["branch"],
        );
    }

}

class Plan {
    Plan({
        required this.value,
        required this.name,
        required this.price,
        required this.features,
        required this.missing,
        required this.recommended,
    });

    final String? value;
    final String? name;
    final int? price;
    final List<String> features;
    final List<String> missing;
    final bool? recommended;

    factory Plan.fromJson(Map<String, dynamic> json){ 
        return Plan(
            value: json["value"],
            name: json["name"],
            price: json["price"],
            features: json["features"] == null ? [] : List<String>.from(json["features"]!.map((x) => x)),
            missing: json["missing"] == null ? [] : List<String>.from(json["missing"]!.map((x) => x)),
            recommended: json["recommended"],
        );
    }

}

class Terms {
    Terms({
        required this.title,
        required this.description,
    });

    final String? title;
    final String? description;

    factory Terms.fromJson(Map<String, dynamic> json){ 
        return Terms(
            title: json["title"],
            description: json["description"],
        );
    }

}
