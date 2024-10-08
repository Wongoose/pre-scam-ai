import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:prescamai/screens/settings/pages/settings_page_password.dart";
import "package:prescamai/screens/settings/pages/settings_report_problem.dart";
import "package:prescamai/screens/settings/widgets/settings_item.dart";
import "package:prescamai/screens/settings/widgets/settings_app_bar.dart";
import "package:prescamai/screens/settings/widgets/settings_square_item.dart";
import "package:prescamai/services/auth.dart";
import "package:prescamai/utilities/navigation.dart";
import "package:prescamai/utilities/show_dialog.dart";

class SettingsMain extends StatelessWidget {
  final AutoSizeGroup squareItemAutoSizeGroup = AutoSizeGroup();
  SettingsMain({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = Get.find();
    return Stack(alignment: Alignment.topCenter, children: [
      SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
        child: Column(children: [
          SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SettingsSquareItem(
                icon: Icons.verified_rounded,
                title: "T&C, Policies",
                description: "Find out more?",
                onPressedFunc: navigateToSettingsInfo,
                autoSizeGroup: squareItemAutoSizeGroup,
              ),
              SizedBox(width: 15),
              SettingsSquareItem(
                icon: Icons.help,
                title: "FAQ, Support",
                description: "Do you need help?",
                onPressedFunc: navigateToSettingsFAQ,
                autoSizeGroup: squareItemAutoSizeGroup,
              ),
            ],
          ),
          SizedBox(height: 15),
          MySettingsItem(
            itemIcon: Icons.dark_mode_rounded,
            text: "Dark theme",
            itemAction: MySettingsItemAction.toggle,
          ),
          SizedBox(height: 15),
          MySettingsItem(
            itemIcon: Icons.lock,
            text: "Password",
            onPressed: () => Get.to(() => SettingsPasswordPage()),
          ),
          SizedBox(height: 15),
          MySettingsItem(
            itemIcon: Icons.error_rounded,
            text: "Report a problem",
            onPressed: () => Get.to(() => SettingsReportProblemPage()),
          ),
          SizedBox(height: 15),
          MySettingsItem(
            itemIcon: Icons.logout_rounded,
            text: "Logout",
            color: Colors.red,
            itemAction: MySettingsItemAction.none,
            onPressed: () => showLogoutDialog(authService),
          ),
        ]),
      ),
      SettingsAppBar(),
    ]);
  }
}
