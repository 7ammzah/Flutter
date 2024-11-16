abstract class User {
  String? firstName;
  String? lastName;
  final String? email;
  String? phoneNumber;

  User(
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
  );

  void resetFirstName(String? first) {
    firstName = first;
  }

  void resetLastName(String? last) {
    lastName = last;
  }

  void resetPhoneNumber(String? num) {
    phoneNumber = num;
  }
}
