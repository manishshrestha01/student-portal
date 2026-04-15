class TermsModel {
  TermsModel({
    required this.sucess,
    required this.data,
  });

  final bool? sucess;
  final String? data;

  factory TermsModel.fromJson(Map<String, dynamic> json) {
    return TermsModel(
      sucess: json["sucess"],
      data: json["data"],
    );
  }
}
