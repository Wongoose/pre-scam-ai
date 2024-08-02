import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:prescamai/controllers/sign_in_controller.dart";
// import "package:get/get.dart";
import "package:prescamai/screens/auth/pages/auth_home.dart";
import "package:prescamai/screens/home/home_wrapper.dart";
// import "package:prescamai/screens/auth/pages/auth_sign_in.dart";
// import "package:prescamai/screens/create_account/pages/create_acc_home.dart";
// import "package:prescamai/screens/home/home_wrapper.dart";
// import "package:prescamai/services/firebase/auth.dart";
// import "package:prescamai/shared/my_confirm_dialog.dart";
// import "package:prescamai/shared/open_inbox.dart";

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    final SignInController signInController = Get.put(SignInController());
    // NOTE: Haven't implemented authentication backend feature
    return Obx(
      () {
        return signInController.tempToggleAuthScreen.value
            ? AuthHome()
            : HomeWrapper();
      },
    );
    // final AuthService authService = Get.put(AuthService());

    // if (authService.appUser.uid == null) {
    //   return AuthHome();
    // // } else if (!authService.appUser.hasUnitId && authService.appUser.isNew) {
    // //   return CreateAccHome(accountEmail: authService.appUser.email!);
    // } else if (!authService.appUser.isVerified) {
    //   return OpenInboxScreen(
    //     initFunction: authService.sendVerificationEmail,
    //     description:
    //         "A verification email was sent to ${authService.appUser.email}. If you do not see the email in a few minutes, check your junk mail or spam folder.",
    //     completedMessage: "Click here after you have verified your email",
    //     completeFunction: () => Get.dialog(MyConfirmDialog(
    //         title: "Create account complete",
    //         body: "Once you have verified your email address, you can login to your account.",
    //         actionText: "Login",
    //         actionColor: Theme.of(context).colorScheme.secondary,
    //         actionFunction: () => Get.offAll(() => AuthSignIn(preEmail: authService.appUser.email)))),
    //   );
    // } else {
    //   return HomeWrapper();
    // }
  }
}
