import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:webview_flutter/webview_flutter.dart";

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: "https://prescamai.mystrikingly.com/privacy-policy",
          javascriptMode: JavascriptMode.disabled,
          backgroundColor: Colors.white,
        ),
        floatingActionButton: SizedBox(
          height: 50,
          width: 50,
          child: FloatingActionButton(
            onPressed: () => Get.back(),
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(
              CupertinoIcons.back,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
