import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:prescamai/controllers/theme_service_controller.dart";
import "package:prescamai/models/scam_model.dart";
import "package:prescamai/screens/home/pages/scam_page.dart";

class SingleScamItem extends StatelessWidget {
  final Scam scam;

  const SingleScamItem({super.key, required this.scam});

  @override
  Widget build(BuildContext context) {
    final MyThemeServiceController themeService =
        Get.put(MyThemeServiceController());

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Get.to(() => ScamPage(scam: scam)),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 65,
              width: 65,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).primaryColor.withOpacity(0.1)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  scam.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    scam.title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: themeService.textColor),
                  ),
                  SizedBox(height: 4),
                  Text(
                    scam.description,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        overflow: TextOverflow.ellipsis,
                        color: themeService.textColor),
                    maxLines: 2,
                  ),
                  SizedBox(height: 4),
                  Chip(
                    label: Text(
                      "Start now",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    backgroundColor: Theme.of(context).cardColor,
                    labelPadding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
