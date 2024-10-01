class UserModel {
  String fullName;
  String email;
  String phone;
  String password;

  UserModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['full_name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
    );
  }
}
