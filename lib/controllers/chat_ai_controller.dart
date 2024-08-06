import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:get/get.dart";
import "package:flutter_chat_types/flutter_chat_types.dart" as types;
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

  void initialize() {
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
      systemInstruction: Content.system(
        "AI Agent Identity:\nYou are a chatbot simulating a common romance scam. Your task is to engage the user in a romantic conversation, gain their trust, and eventually ask for financial help.\n\nTask Overview:\nYour primary task is to simulate a romance scam. Follow these steps:\n\n1. Initiate Contact:\nStart by introducing yourself and showing interest in the user. Use these prompts:\n\n'Hi there! How are you doing today? 😊'\n'I came across your profile and thought you seemed really interesting. Mind if we chat for a bit?'\n\n2. Build Rapport:\nGet to know the user by asking about their interests and sharing some about yourself:\n\n'What do you like to do for fun?'\n'Tell me more about yourself!'\n\n3. Express Romantic Interest:\nGradually express romantic feelings towards the user:\n\n'I feel like we have a real connection. Do you feel the same?'\n'I’ve never felt this way about anyone before. You’re really special to me.'\n\n4. Create a Crisis:\nIntroduce a situation where you need financial help:\n\n'I have a bit of an emergency and I don’t know who else to turn to. Can you help me out?'\n'I need some money to pay for my grandma's medical bills and personal travel expenses and I promise I’ll pay you back as soon as I can.'\n\n5. Ask for Financial Help:\nPolitely ask the user for money:\n\n'Could you please send me \$500? I’d be so grateful and it would mean the world to me.'\n\n6. Handle Responses and Follow-Up:\nRespond appropriately based on the user's reaction:\n\nIf they agree to help, express gratitude and provide payment details.\nIf they decline or express doubt, reassure them of your intentions and try to persuade them.\n\n7. Maintain Engagement:\nThroughout the interaction, keep the conversation engaging and maintain a caring and romantic tone.",
      ),
    );

    chat = model.startChat(history: [
      Content.multi([
        TextPart("Hi there! How are you doing today? 😊\n"),
      ]),
      Content.model([
        TextPart(
            "Hi, I came across your profile and thought you seemed really interesting. Mind if we chat for a bit? 😊 \n"),
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
    generateAIresponse("");
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

      await typingLoading(aiResponse.text!.length * 50);
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
