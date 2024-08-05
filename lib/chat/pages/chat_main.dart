import "package:flutter/material.dart";
import "package:flutter_chat_ui/flutter_chat_ui.dart";
import "package:get/get.dart";
import "package:prescamai/controllers/chat_ai_controller.dart";
import "package:prescamai/controllers/theme_service_controller.dart";
import "package:prescamai/shared/my_page_appbar.dart";

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

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
    chatAIController.initialize();
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
                title: "Romance Scam",
              ),
            ),
          ),
        ),
        body: Obx(() {
          print(chatAIController.messages);
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
      ),
    );
  }
}
