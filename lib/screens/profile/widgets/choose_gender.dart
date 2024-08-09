import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:prescamai/controllers/theme_service_controller.dart";
import "package:prescamai/controllers/user_details_controller.dart";

class ChooseGender extends StatelessWidget {
  const ChooseGender({super.key});

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService =
        Get.put(MyThemeServiceController());

    final UserDetailsController userDetailsController = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "Gender",
            style: TextStyle(
              color: themeService.textColor54,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Obx(
          () => Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () =>
                      userDetailsController.genderIsMaleController.value = true,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: userDetailsController
                                    .genderIsMaleController.value ==
                                true
                            ? Theme.of(context).colorScheme.secondary
                            : themeService.textColor26,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Male",
                        style: TextStyle(
                          color: userDetailsController
                                      .genderIsMaleController.value ==
                                  true
                              ? Theme.of(context).colorScheme.secondary
                              : themeService.textColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: GestureDetector(
                  onTap: () => userDetailsController
                      .genderIsMaleController.value = false,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: userDetailsController
                                    .genderIsMaleController.value ==
                                false
                            ? Theme.of(context).colorScheme.secondary
                            : themeService.textColor26,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Female",
                        style: TextStyle(
                          color: userDetailsController
                                      .genderIsMaleController.value ==
                                  false
                              ? Theme.of(context).colorScheme.secondary
                              : themeService.textColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
