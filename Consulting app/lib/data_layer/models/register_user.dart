class UserRegister {
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  UserRegister({this.firstName, this.lastName, this.email, this.password});

  UserRegister.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson(UserRegister user) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = user.firstName;
    data['last_name'] = user.lastName;
    data['email'] = user.email;
    data['password'] = user.password;
    return data;
  }
}

class ExpertRegister {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? fieldId;

  ExpertRegister({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.fieldId,
  });

  ExpertRegister.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    fieldId = json['field_id'];
  }

  Map<String, dynamic> toJson(ExpertRegister user) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = user.firstName;
    data['last_name'] = user.lastName;
    data['email'] = user.email;
    data['password'] = user.password;
    data['field_id'] = user.fieldId;
    return data;
  }
}

