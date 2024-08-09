import "package:flutter/material.dart";
import "package:prescamai/screens/settings/widgets/settings_item.dart";
import "package:prescamai/shared/my_page_appbar.dart";
import "package:prescamai/utilities/navigation.dart";

class SettingsInformationPage extends StatelessWidget {
  const SettingsInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyPageAppBar(
                title: "T&C, Policies", appBarType: MyAppBarType.xmark),
            SizedBox(height: 40),
            MySettingsItem(
              itemIcon: Icons.book,
              text: "Terms & Conditions",
              onPressed: () => navigateToTermsAndConditions(),
            ),
            SizedBox(height: 15),
            MySettingsItem(
              itemIcon: Icons.privacy_tip_rounded,
              text: "Privacy Policy",
              onPressed: () => navigateToPrivacyPolicy(),
            ),
          ],
        ),
      )),
    );
  }
}
