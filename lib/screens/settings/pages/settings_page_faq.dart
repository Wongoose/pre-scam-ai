import "package:flutter/material.dart";
import "package:prescamai/screens/settings/widgets/faq_item.dart";
import "package:prescamai/shared/my_page_appbar.dart";

class SettingsFAQPage extends StatelessWidget {
  final List<List<String>> faqList = [
    [
      "What is this app?",
      "This app is an AI-driven simulator that educates users on common online scams, such as phishing, ransomware, and tech support scams."
    ],
    [
      "How does the AI work?",
      "The AI simulates real-life scam scenarios, helping users recognize red flags and learn how to protect themselves."
    ],
    [
      "Can this app protect me from scams?",
      "While the app cannot prevent scams, it equips you with the knowledge and awareness to spot and avoid them."
    ],
    [
      "Why does the app simulate scams?",
      "The app uses simulations to create a realistic learning environment, making it easier for users to understand and remember how to respond to scam attempts."
    ],
    [
      "Is my data safe?",
      "Yes, the app prioritizes user privacy and does not store any sensitive personal information."
    ],
    [
      "How do I report a suspicious activity?",
      "If you encounter a suspicious scenario, you can report it using the in-app reporting feature to help others stay informed."
    ],
    [
      "Can I use the app offline?",
      "No, an internet connection is required for the AI simulations and updates."
    ],
    [
      "How often is the content updated?",
      "The app regularly updates its scam scenarios to keep up with evolving tactics used by scammers."
    ]
  ];
  SettingsFAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.fromLTRB(22, 32, 22, 32),
        child: Column(
          children: [
            MyPageAppBar(title: "FAQ, Support", appBarType: MyAppBarType.xmark),
            SizedBox(height: 40),
            Expanded(
              child: ListView.separated(
                itemCount: faqList.length,
                itemBuilder: (context, i) => FAQItem(
                  question: faqList[i][0],
                  description: faqList[i][1],
                ),
                separatorBuilder: (context, i) => SizedBox(height: 15),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
