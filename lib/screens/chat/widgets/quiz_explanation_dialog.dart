import "package:flutter/material.dart";
import "package:prescamai/shared/my_text_widgets.dart";

class ExplanationDialog extends StatelessWidget {
  final String title;
  final String explanation;
  final VoidCallback onContinue;

  const ExplanationDialog({
    super.key,
    required this.title,
    required this.explanation,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        clipBehavior: Clip.antiAlias,
        insetPadding: EdgeInsets.symmetric(horizontal: 60),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 30),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: MyTextBolded(
                title,
                fontSize: 24,
                textAlign: TextAlign.center,
              )),
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: MyText(
                explanation,
                textAlign: TextAlign.center,
              )),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: Colors.transparent,
            child: TextButton(
                onPressed: onContinue,
                child: Text("Continue",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary))),
          ),
        ]),
      ),
    );
  }
}
