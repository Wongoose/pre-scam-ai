import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:prescamai/controllers/theme_service_controller.dart";
import "package:prescamai/models/scam_model.dart";
import "package:prescamai/screens/home/widgets/home_leaderboards_card.dart";
import "package:prescamai/shared/my_page_appbar.dart";

class ScamPage extends StatelessWidget {
  final Scam scam;
  const ScamPage({super.key, required this.scam});

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService =
        Get.put(MyThemeServiceController());

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 32, 25, 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyPageAppBar(
                              title: "PreScam.AI",
                              appBarType: MyAppBarType.xmark),
                          SizedBox(height: 10),
                          Center(
                            child: Container(
                              height: 65,
                              width: 65,
                              padding: EdgeInsets.all(8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  scam.img,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Center(
                            child: Text(
                              scam.title,
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: themeService.textColor),
                            ),
                          ),
                          SizedBox(height: 30),
                          HomeLeaderboardsCard(),
                          SizedBox(height: 30),
                          Card(
                            color: Theme.of(context).cardColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 20, 25, 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Description",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          // overflow: TextOverflow.ellipsis,
                                          color: themeService.textColor),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      scam.longDescription,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Nunito",
                                          // overflow: TextOverflow.ellipsis,
                                          color: themeService.textColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Card(
                            color: Theme.of(context).cardColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 20, 25, 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "How to identify?",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          // overflow: TextOverflow.ellipsis,
                                          color: themeService.textColor),
                                    ),
                                    SizedBox(height: 8),
                                    ...scam.identify.map((string) {
                                      return Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 12),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "\u2022", // Bullet point
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Nunito",
                                                color: themeService.textColor,
                                              ),
                                            ),
                                            SizedBox(
                                                width:
                                                    5), // Space between bullet and text
                                            Expanded(
                                              child: Text(
                                                string,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Nunito",
                                                  color: themeService.textColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Expanded(child: Container()),
                  // MyExpandedButton(text: "Start chat"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
