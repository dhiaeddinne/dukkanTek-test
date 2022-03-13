class UserDataModel {
  String? email;
  String? password;
  String? id;

  UserDataModel({this.email, this.password, this.id});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] =  email;
    data['password'] = password;
    data['id'] = id;
    return data;
  }
}