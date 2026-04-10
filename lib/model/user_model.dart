class UserModel {
  UserModel({required this.success, required this.user});

  final bool? success;
  final User? user;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      success: json["success"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.countryCode,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? countryCode;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      countryCode: json["address"],
    );
  }
}
