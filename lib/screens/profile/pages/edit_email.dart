import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:prescamai/controllers/theme_service_controller.dart";
import "package:prescamai/controllers/user_details_controller.dart";
import "package:prescamai/screens/profile/widgets/textfield_email.dart";
import "package:prescamai/shared/all_loading.dart";
import "package:prescamai/shared/my_expanded_btn.dart";
import "package:prescamai/shared/my_page_appbar.dart";

class EditEmailPage extends StatelessWidget {
  const EditEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserDetailsController userDetailsController = Get.find();
    final MyThemeServiceController themeService =
        Get.put(MyThemeServiceController());

    userDetailsController.emailController.text =
        userDetailsController.email ?? "";
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyPageAppBar(
                    title: "Edit profile", appBarType: MyAppBarType.back),
                // Expanded(child: Container()),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                  child: Text(
                    "Your email",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Nunito",
                      color: themeService.textColor54,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Form(
                  onChanged: () => userDetailsController.updateEditChanges(),
                  child: TextFieldEmail(
                      textController: userDetailsController.emailController),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Obx(() {
            userDetailsController.updateEditChanges();
            return userDetailsController.isLoading.isTrue
                ? CircleLoading(size: 1.5)
                : MyExpandedButton(
                    text: "Verify new email",
                    color: userDetailsController.emailHasChanges.value
                        ? null
                        : themeService.textColor26,
                    onPressFunc: () => userDetailsController.updateEmail());
          })
        ],
      )),
    );
  }
}
