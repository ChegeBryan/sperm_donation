class Admin {
  String? email;

  Admin({this.email});

  factory Admin.fromJson(Map<String, dynamic> responseData) {
    return Admin(email: responseData['email']);
  }
}
