class LoginUserModel {
  String? email;
  String? password;
  String? name;
  String? nickname;
  String? imageUrl;
  String? token;
  String? expiry;
  String? client;

  int? id;

  LoginUserModel({
    this.email,
    this.password,
    this.name,
    this.nickname,
    this.imageUrl,
    this.id,
    this.client,
    this.token,
    this.expiry,
  });

  @override
  LoginUserModel.fromJson(Map<String, dynamic> json) {
    email = json["data"]["email"];
    name = json["data"]["name"];
    nickname = json["data"]["nickname"];
    id = json["data"]["id"];
    //return User(email: email, name: name, nickname: nickname, id: id);
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'name': name,
        'nickname': nickname,
        'url': imageUrl,
      };

  void setImage(String imageUrl) {
    this.imageUrl = imageUrl;
  }

  void setHeaderParams(String? token, String? client, String? expiry) {
    this.token = token;
    this.client = client;
    this.expiry = expiry;
  }
}
