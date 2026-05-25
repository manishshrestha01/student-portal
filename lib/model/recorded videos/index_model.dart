class IndexModel {
    IndexModel({
        required this.success,
        required this.message,
        required this.data,
    });

    final bool? success;
    final String? message;
    final List<Datum> data;

    factory IndexModel.fromJson(Map<String, dynamic> json){ 
        return IndexModel(
            success: json["success"],
            message: json["message"],
            data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        );
    }

}

class Datum {
    Datum({
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

    factory Datum.fromJson(Map<String, dynamic> json){ 
        return Datum(
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
