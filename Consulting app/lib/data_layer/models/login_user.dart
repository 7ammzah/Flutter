//for both client and expert

class LoginUser {
  String? email;
  String? password;

  LoginUser({this.email, this.password});

  LoginUser.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson(LoginUser user) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = user.email;
    data['password'] = user.password;
    return data;
  }
}

