class Expert {
  int? id;
  String? firstName;
  String? lastName;
  String? category;
  int? fieldId;
  int? yearsOfExperience;
  String? path;
  String? phone;
  String? address;
  double? price;
  String? email;

  get getFullName {
    return '${firstName!} ${lastName!}';
  }

  Expert(
      {this.id,
      this.firstName,
      this.lastName,
      this.category,
      this.fieldId,
      this.yearsOfExperience,
      this.path,
      this.phone,
      this.address,
      this.price,
      this.email});

  Expert.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    category = json['category'];
    fieldId = json['field_id'];
    yearsOfExperience = json['years_of_experience'];
    path = json['path'];
    phone = json['phone'];
    address = json['address'];
    price = json['price'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['category'] = category;
    data['field_id'] = fieldId;
    data['years_of_experience'] = yearsOfExperience;
    data['path'] = path;
    data['phone'] = phone;
    data['address'] = address;
    data['price'] = price;
    data['email'] = email;
    return data;
  }
}

