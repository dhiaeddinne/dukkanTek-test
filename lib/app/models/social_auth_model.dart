class SocialAuthModel {
  String? id;
  String? name;
  String? email;
  String? photoUrl;
  String? firstName;
  String? lastName;
  String? authToken;
  String? idToken;
  String? provider;

  SocialAuthModel(
      {this.id,
        this.name,
        this.email,
        this.photoUrl,
        this.firstName,
        this.lastName,
        this.authToken,
        this.idToken,
        this.provider});

  SocialAuthModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    authToken = json['authToken'];
    idToken = json['idToken'];
    provider = json['provider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['authToken'] = this.authToken;
    data['idToken'] = this.idToken;
    data['provider'] = this.provider;
    return data;
  }
}
