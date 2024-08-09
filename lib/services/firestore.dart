import "package:cloud_firestore/cloud_firestore.dart";
import "package:get/get.dart";
import "package:prescamai/models/model_user.dart";
import "package:prescamai/services/auth.dart";
import "package:prescamai/shared/shared_classes.dart";

class DatabaseService extends GetxController {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference supportCollection =
      FirebaseFirestore.instance.collection("support");
  late AuthService authService;

  // Getters
  AppUser get appUser => authService.appUser;

  // Methods
  void createNewUser(String uid, String email) async {
    await usersCollection.doc(uid).set({"email": email});
  }

  Future<void> initUser(AppUser appUser) async {
    try {
      authService = Get.find();
      final DocumentSnapshot doc = await usersCollection.doc(appUser.uid).get();
      if (!doc.exists) {
        createNewUser(appUser.uid!, appUser.email!);
        return;
      }
      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      appUser.fullName.value = data["fullName"].toString();
      appUser.genderIsMale = data["genderIsMale"];

      // Syncing auth email to firestore
      if (appUser.isVerified) {
        await usersCollection.doc(appUser.uid).update({"email": appUser.email});
      }
    } catch (err) {
      return;
    }
  }

  Future<ReturnValue> updateUser(Map<String, dynamic> data) async {
    try {
      await usersCollection.doc(appUser.uid).update(data);
      return (ReturnValue(true, ""));
    } catch (err) {
      return (ReturnValue(false, err.toString()));
    }
  }

  Future<ReturnValue> submitReportProblem(String string) async {
    try {
      await supportCollection.add({
        "residentUID": appUser.uid,
        "name": appUser.fullName.value,
        "email": appUser.email,
        "problem": string,
      });

      return (ReturnValue(true, ""));
    } catch (err) {
      print("Failed with catch err: $err");
      return (ReturnValue(false, err.toString()));
    }
  }
}
