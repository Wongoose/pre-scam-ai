import "package:get/get.dart";

class AppUser extends GetxController {
  // Auth identifiers
  final String? uid;
  final String? email;
  final String? provider;
  final bool isVerified;

  // Variables
  RxString fullName = "".obs;
  bool? genderIsMale;
  RxInt points = 0.obs;

  AppUser(
      {this.provider,
      this.email,
      this.uid,
      this.isVerified = false,
      this.genderIsMale});

  // Getters
  bool get hasProfileDetails => fullName.isNotEmpty && genderIsMale != null;
}
