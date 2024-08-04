import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:prescamai/controllers/theme_service_controller.dart";
import "package:prescamai/screens/home/widgets/single_scam_item.dart";
import "package:prescamai/shared/my_theme_divider.dart";

class HomeScamList extends StatelessWidget {
  const HomeScamList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final VisitorDBService _db = Get.put(VisitorDBService());
    // final AuthService authService = Get.find();
    final MyThemeServiceController themeService =
        Get.put(MyThemeServiceController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Top 10 scams",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: themeService.textColor87)),
              GestureDetector(
                  // onTap: () => Get.to(() => AllVisitorsMain()),
                  onTap: () {},
                  child: Icon(Icons.more_horiz,
                      size: 30, color: themeService.textColor70)),
            ],
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: Card(
            color: Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              // padding: EdgeInsets.fromLTRB(25, 30, 25, 30),
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                // future: _db.getVisitors(),
                future: null,
                builder: (context, snapshot) {
                  // final List<Visitor> data = authService.appUser.upcomingVisitors;

                  return ListView.separated(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return SingleScamItem();
                    },
                    separatorBuilder: (context, index) {
                      return ThemedDivider(height: 50);
                    },
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
