import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:e_commerce_app/domain/firebase_options.dart';
import 'package:e_commerce_app/routes/messaging/fcm_manager.dart';

import 'core/app_export.dart';

const String flavor = String.fromEnvironment('app.env');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]);

  await initFcm();
  await setupFlutterNotifications();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);

  // runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: kDebugMode,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      title: 'E-Commerce App',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.splashScreen,
      navigatorKey: GlobalKeys.navigatorKey,
      getPages: AppRoutes.pages,
    );
  }
}

class GlobalKeys {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: 'dialog');
}
