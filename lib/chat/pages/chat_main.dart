import "dart:convert";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_chat_types/flutter_chat_types.dart" as types;
import "package:flutter_chat_ui/flutter_chat_ui.dart";
import "package:prescamai/shared/my_page_appbar.dart";
import "package:uuid/uuid.dart";

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = [];
  final _user = const types.User(
    id: "82091008-a484-4a89-ae75-a22bf8d6f3ac",
  );

  final _bot = const types.User(
    id: "82091008-a484-4a89-ae75-a22bf8d6f3ad",
  );

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text("Photo"),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text("File"),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text("Cancel"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    // if (message is types.FileMessage) {
    //   var localPath = message.uri;

    //   if (message.uri.startsWith("http")) {
    //     try {
    //       final index =
    //           _messages.indexWhere((element) => element.id == message.id);
    //       final updatedMessage =
    //           (_messages[index] as types.FileMessage).copyWith(
    //         isLoading: true,
    //       );

    //       setState(() {
    //         _messages[index] = updatedMessage;
    //       });

    //       final client = http.Client();
    //       final request = await client.get(Uri.parse(message.uri));
    //       final bytes = request.bodyBytes;
    //       final documentsDir = (await getApplicationDocumentsDirectory()).path;
    //       localPath = "$documentsDir/${message.name}";

    //       if (!File(localPath).existsSync()) {
    //         final file = File(localPath);
    //         await file.writeAsBytes(bytes);
    //       }
    //     } finally {
    //       final index =
    //           _messages.indexWhere((element) => element.id == message.id);
    //       final updatedMessage =
    //           (_messages[index] as types.FileMessage).copyWith(
    //         isLoading: null,
    //       );

    //       setState(() {
    //         _messages[index] = updatedMessage;
    //       });
    //     }
    //   }

    //   await OpenFilex.open(localPath);
    // }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);

    await Future.delayed(Duration(seconds: 2));
    final response = types.TextMessage(
      author: _bot,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: "I am responding",
    );
    _addMessage(response);
  }

  void _loadMessages() async {
    try {
      final response = await rootBundle.loadString("assets/messages.json");
      final messages = (jsonDecode(response) as List)
          .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
          .toList();

      setState(() {
        _messages = messages;
      });
    } catch (err) {
      print("Empty");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: DarkChatTheme().backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: Container(
            decoration: BoxDecoration(
                color: DarkChatTheme().inputBackgroundColor,
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
        body: Chat(
          messages: _messages,
          onAttachmentPressed: _handleAttachmentPressed,
          onMessageTap: _handleMessageTap,
          onPreviewDataFetched: _handlePreviewDataFetched,
          onSendPressed: _handleSendPressed,
          showUserAvatars: true,
          showUserNames: true,
          user: _user,
          theme: DarkChatTheme(),
        ),
      ),
    );
  }
}
