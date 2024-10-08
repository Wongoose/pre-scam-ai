import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
// ignore: depend_on_referenced_packages
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:get/get.dart";
import "package:get_storage/get_storage.dart";
import "package:prescamai/firebase_options.dart";
import "package:prescamai/screens/auth/pages/auth_wrapper.dart";
import "package:prescamai/controllers/theme_service_controller.dart";
import "package:prescamai/services/auth.dart";
import "package:prescamai/services/firestore.dart";
import "package:prescamai/shared/splash_screen.dart";
import "package:prescamai/utilities/delay.dart";
import "package:overlay_support/overlay_support.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(DatabaseService());
  Get.put(AuthService());
  runApp(PreScamAIApp());
}

class PreScamAIApp extends StatelessWidget {
  const PreScamAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return OverlaySupport.global(
      child: GetMaterialApp(
        transitionDuration: Duration(milliseconds: 300),
        defaultTransition: Transition.rightToLeft,
        debugShowCheckedModeBanner: false,
        title: "PreScam.AI",
        themeMode: MyThemeServiceController().themeMode,
        theme: MyThemeServiceController.light,
        darkTheme: MyThemeServiceController.dark,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.linear(1.0)),
            child: child!,
          );
        },
        home: FutureBuilder(
          future: delaySeconds(2),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
            } else if (snapshot.connectionState == ConnectionState.done) {
              return AuthWrapper();
            }
            // Show splash screen while loading
            return SplashScreen();
          },
        ),
      ),
    );
  }
}
