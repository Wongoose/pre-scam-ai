import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:prescamai/controllers/theme_service_controller.dart";
import "package:prescamai/controllers/user_details_controller.dart";
import "package:prescamai/screens/profile/widgets/choose_gender.dart";
import "package:prescamai/shared/all_loading.dart";
import "package:prescamai/shared/my_expanded_btn.dart";
import "package:prescamai/shared/my_page_appbar.dart";

class EditGenderPage extends StatelessWidget {
  const EditGenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserDetailsController userDetailsController = Get.find();
    final MyThemeServiceController themeService =
        Get.put(MyThemeServiceController());

    userDetailsController.genderIsMaleController.value =
        userDetailsController.genderIsMale ?? true;
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyPageAppBar(
                    title: "Edit profile", appBarType: MyAppBarType.back),
                // Expanded(child: Container()),
                SizedBox(height: 40),
                ChooseGender(),
              ],
            ),
          ),
          Expanded(child: Container()),
          Obx(() {
            userDetailsController.updateEditChanges();
            return userDetailsController.isLoading.isTrue
                ? CircleLoading(size: 1.5)
                : MyExpandedButton(
                    text: "Save changes",
                    color: userDetailsController.genderHasChanges.value
                        ? null
                        : themeService.textColor26,
                    onPressFunc: userDetailsController.updateGender);
          }),
        ]),
      ),
    );
  }
}
