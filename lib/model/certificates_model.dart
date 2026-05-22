class CertificatesModel {
    CertificatesModel({
        required this.sucess,
        required this.data,
    });

    final bool? sucess;
    final List<Datum> data;

    factory CertificatesModel.fromJson(Map<String, dynamic> json){ 
        return CertificatesModel(
            sucess: json["sucess"],
            data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        );
    }

}

class Datum {
    Datum({
        required this.certificateId,
        required this.courseName,
        required this.issuedTo,
        required this.courseCompletionDate,
        required this.downloadCertificate,
    });

    final int? certificateId;
    final String? courseName;
    final String? issuedTo;
    final String? courseCompletionDate;
    final String? downloadCertificate;

    factory Datum.fromJson(Map<String, dynamic> json){ 
        return Datum(
            certificateId: int.tryParse(json["certificate_id"]?.toString() ?? ""),
            courseName: json["course_name"],
            issuedTo: json["Issued to"],
            courseCompletionDate: json["course_completion_Date"],
            downloadCertificate: json["download_certificate"],
        );
    }

}
