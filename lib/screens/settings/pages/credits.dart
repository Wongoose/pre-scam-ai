import "dart:convert";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:webview_flutter/webview_flutter.dart";

class CreditsPage extends StatelessWidget {
  const CreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    late WebViewController controller;

    void loadHtmlFromAssets() async {
      String fileText = await rootBundle.loadString("assets/html/credits.html");
      controller.loadUrl(Uri.dataFromString(fileText,
              mimeType: "text/html", encoding: Encoding.getByName("utf-8"))
          .toString());
    }

    return SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: "about:blank",
          javascriptMode: JavascriptMode.disabled,
          onWebViewCreated: (WebViewController webViewController) {
            controller = webViewController;
            loadHtmlFromAssets();
          },
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
