class User {
  String? email;
  String? role;

  User({this.email, this.role});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      email: responseData['email'],
      role: responseData['role'],
    );
  }
}
