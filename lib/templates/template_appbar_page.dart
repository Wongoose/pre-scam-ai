import "package:flutter/material.dart";
import "package:prescamai/shared/my_page_appbar.dart";

class TemplateAppBarPage extends StatelessWidget {
  const TemplateAppBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
        child: Column(
          children: [
            MyPageAppBar(title: "Open gates", appBarType: MyAppBarType.xmark),
            Expanded(child: Container()),
            const SizedBox(height: 40),
          ],
        ),
      )),
    );
  }
}
