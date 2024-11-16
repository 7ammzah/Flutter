import 'user.dart';

class Client extends User {
  final bool isExpert = false;

  Client(
    super.firstName,
    super.lastName,
    super.email,
    super.phoneNumber,
  );
}
