// import "package:flutter/material.dart";
// import "package:get/get.dart";
// import "package:prescamai/shared/my_confirm_dialog.dart";
// import "package:prescamai/models/model_admin_classes.dart";
// import "package:prescamai/models/model_visitor.dart";
// import "package:prescamai/screens/admin/widgets/manage_acc_dialog.dart";
// import "package:prescamai/screens/admin/widgets/manage_unit_dialog.dart";
// import "package:prescamai/screens/visitor_registration/widgets/vreg_confirm_visitor_dialog.dart";
// import "package:prescamai/services/firebase/auth.dart";
// import "package:prescamai/shared/my_confirm_dialog.dart";

// Future showManageUnitDialog(Unit unit) async {
//   return Get.dialog(ManageUnitDialog(unit: unit));
// }

// Future showManageAccDialog(Account account) async {
//   return Get.dialog(ManageAccDialog(account: account));
// }

// Future showLogoutDialog(AuthService authService) async {
//   return Get.dialog(MyConfirmDialog(
//       title: "Confirm logout?",
//       body: "Are you sure to logout of this account?",
//       actionText: "Logout",
//       actionColor: Colors.red,
//       actionFunction: () {
//         authService.logout();
//       }));
// }

// Future showConfirmVisitorDialog(Visitor visitor) async {
//   return Get.dialog(ConfirmVisitorDialog(visitor: visitor));
// }
