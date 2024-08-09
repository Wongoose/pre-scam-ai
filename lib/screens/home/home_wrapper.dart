import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:prescamai/controllers/theme_service_controller.dart";
import "package:prescamai/screens/home/pages/home.dart";
import "package:prescamai/screens/settings/pages/settings_main.dart";
import "package:prescamai/shared/my_bottom_navbar.dart";

class HomeWrapper extends StatelessWidget {
  const HomeWrapper({super.key});

  // final AuthService authService = Get.put(AuthService());
  @override
  Widget build(BuildContext context) {
    final PageController pageController =
        Get.put(PageController(initialPage: 0));

    final MyThemeServiceController themeService =
        Get.put(MyThemeServiceController());
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (value) => themeService.homePageSelected(value == 0),
          children: [
            Home(),
            SettingsMain(),
          ],
        ),
        // floatingActionButton: MyFAB(),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: MyBottomNavBar(pageController: pageController),
      ),
    );
  }
}
