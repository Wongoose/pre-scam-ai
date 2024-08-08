import "package:flutter/material.dart";
import "package:flutter_chat_ui/flutter_chat_ui.dart";
import "package:get/get.dart";
import "package:prescamai/controllers/chat_ai_controller.dart";
import "package:prescamai/controllers/theme_service_controller.dart";
import "package:prescamai/models/scam_model.dart";
import "package:prescamai/screens/chat/widgets/quiz_fab.dart";
import "package:prescamai/shared/my_page_appbar.dart";

class ChatPage extends StatefulWidget {
  final Scam scam;
  const ChatPage({super.key, required this.scam});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final MyThemeServiceController themeService =
      Get.put(MyThemeServiceController());
  final ChatAIController chatAIController = Get.put(ChatAIController());

  @override
  void initState() {
    super.initState();
    chatAIController.initialize(widget.scam);
    chatAIController.loadMessages();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeService.themeMode == ThemeMode.dark
            ? DarkChatTheme().backgroundColor
            : Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: Container(
            decoration: BoxDecoration(
                color: themeService.themeMode == ThemeMode.dark
                    ? DarkChatTheme().inputBackgroundColor
                    : Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
              child: MyPageAppBar(
                appBarType: MyAppBarType.back,
                title: widget.scam.title,
              ),
            ),
          ),
        ),
        body: Obx(() {
          print(chatAIController.messages.isEmpty);
          return Chat(
            messages: chatAIController.messages,
            onSendPressed: chatAIController.handleSendPressed,
            showUserAvatars: true,
            showUserNames: true,
            user: chatAIController.user,
            theme: themeService.themeMode == ThemeMode.dark
                ? DarkChatTheme()
                : DefaultChatTheme(),
          );
        }),
        floatingActionButton: Obx(() {
          return chatAIController.showQuizPrompt.value == QuizPrompt.none
              ? Container()
              : StartQuizFAB(
                  onPressedFunc: () {},
                  quizPrompt: chatAIController.showQuizPrompt.value,
                  messageCount: 8 - chatAIController.messages.length ~/ 2,
                );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      ),
    );
  }
}
