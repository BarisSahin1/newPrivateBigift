class User {
  String? email;
  String? password;
  String? name;
  String? nickname;
  String? url;

  User({
    this.email,
    this.password,
    this.name,
    this.nickname,
    this.url,
  });

  User.fromJson(Map<String, dynamic> json, String imageUrl) {
    email = json["data"]["email"];
    name = json["data"]["name"];
    nickname = json["data"]["nickname"];
    url = imageUrl;
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'name': name,
        'nickname': nickname,
        'url': url,
      };
}
