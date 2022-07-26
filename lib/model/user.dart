class User {
  String? email;
  String? password;
  String? name;
  static bool isLoggedIn = false;

  User({
    this.email,
    this.password,
    this.name,
  });

  User.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    password = json["password"];
    name = json["name"];
  }
}
