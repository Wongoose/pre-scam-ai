import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:prescamai/controllers/theme_service_controller.dart";

class SingleScamItem extends StatelessWidget {
  // final Visitor visitor;

  const SingleScamItem({
    super.key,
    // required this.visitor,
  });

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService =
        Get.put(MyThemeServiceController());

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      // onTap: () => Get.dialog(VisitorInfoDialog(visitor: visitor, showArrivalStatus: upcoming)),
      onTap: () {},
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).primaryColor.withOpacity(0.1)),
              child: Image(image: AssetImage("assets/images/love.png")),
            ),
            SizedBox(width: 20),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Romance scam",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: themeService.textColor),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Romance scams are a threat to anyone seeking love online",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        overflow: TextOverflow.ellipsis,
                        color: themeService.textColor),
                  ),
                  SizedBox(height: 4),
                  Chip(
                    label: Text(
                      "Not started",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          overflow: TextOverflow.ellipsis,
                          color: themeService.textColor),
                    ),
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    labelPadding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
