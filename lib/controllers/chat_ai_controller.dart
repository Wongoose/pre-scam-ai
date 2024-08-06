import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:get/get.dart";
import "package:flutter_chat_types/flutter_chat_types.dart" as types;
import "package:prescamai/models/scam_model.dart";
import "package:uuid/uuid.dart";
import "package:google_generative_ai/google_generative_ai.dart";

enum ChatScamType { romance, pishing, none }

class ChatAIController extends GetxController {
  RxList<types.Message> messages = RxList<types.Message>();
  ChatScamType scamType = ChatScamType.none;
  final types.User user = types.User(id: "user");
  final types.User bot = types.User(id: "bot");

  // AI params
  final String? _apiKey = dotenv.env["GEMINI_API_KEY"];
  late GenerativeModel model;
  late ChatSession chat;

  void initialize(Scam scam) {
    model = GenerativeModel(
      model: "gemini-1.5-flash",
      apiKey: apiKey,
      safetySettings: [
        SafetySetting(HarmCategory.harassment, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.none)
      ],
      generationConfig: GenerationConfig(
        temperature: 1,
        topK: 64,
        topP: 0.95,
        maxOutputTokens: 8192,
        responseMimeType: "text/plain",
      ),
      // Extract text from file
      systemInstruction: Content.system(scam.aiIdentity),
    );

    chat = model.startChat(history: [
      Content.multi([
        TextPart(scam.exampleInput),
      ]),
      Content.model([
        TextPart(scam.exampleModel),
      ]),
    ]);
  }

  // Getters
  String get apiKey {
    if (_apiKey == null) {
      return "";
    } else {
      return _apiKey;
    }
  }

  // Functions
  Future<void> loadMessages() async {
    generateAIresponse("Hi, I am ZX");
  }

  void addMessage(types.Message message) {
    messages.insert(0, message);
  }

  void removeMessage(types.Message message) {
    messages.remove(message);
  }

  Future<void> typingLoading(int milliseconds) async {
    final types.TextMessage loadingMessage = types.TextMessage(
      author: bot,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: "Typing...",
    );
    addMessage(loadingMessage);
    await Future.delayed(Duration(milliseconds: milliseconds));
    removeMessage(loadingMessage);
  }

  Future<void> handleSendPressed(types.PartialText message) async {
    final types.TextMessage textMessage = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    addMessage(textMessage);
    await generateAIresponse(textMessage.text);
  }

  Future<void> generateAIresponse(String userInput) async {
    try {
      // Generate AI response
      final content = Content.text(userInput);

      final GenerateContentResponse aiResponse =
          await chat.sendMessage(content);
      final types.TextMessage textMessage = types.TextMessage(
        author: bot,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: aiResponse.text!.trim(),
      );

      await typingLoading(aiResponse.text!.length * 25);
      addMessage(textMessage);
    } catch (err) {
      print("AI response was blocked due to safety settings: $err");
      final types.TextMessage textMessage = types.TextMessage(
          author: bot,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: const Uuid().v4(),
          text:
              "Sorry, I couldn't understand what you meant. Could you repeat what you said?");
      await Future.delayed(Duration(seconds: 1));
      addMessage(textMessage);
    }
  }
}
