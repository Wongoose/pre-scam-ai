import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:prescamai/services/auth.dart";
import "package:prescamai/shared/my_confirm_dialog.dart";

Future showLogoutDialog(AuthService authService) async {
  return Get.dialog(MyConfirmDialog(
      title: "Confirm logout?",
      body: "Are you sure to logout of this account?",
      actionText: "Logout",
      actionColor: Colors.red,
      actionFunction: () {
        authService.logout();
      }));
}
