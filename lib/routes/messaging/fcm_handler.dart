import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:e_commerce_app/core/app_export.dart';
import 'package:e_commerce_app/routes/messaging/fcm_manager.dart';

class FcmHandler {
  StreamSubscription? _streamSubscription;

  void dispose() {
    _streamSubscription?.cancel();
  }

  void listenForFcm() {
    if (!kIsWeb) {
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        Logger.log(
            'FirebaseMessaging - onMessageOpenedApp - Got a message whilst in the foreground!');
        Logger.log(
            'FirebaseMessaging - onMessageOpenedApp - Message data: ${message.data["deeplink"]}');

        if (message.notification != null) {
          showFlutterNotification(message);
        }
      });

      _streamSubscription =
          FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        Logger.log(
            'FirebaseMessaging - Got a message whilst in the foreground!');
        Logger.log(
            'FirebaseMessaging - Message data: ${message.data["deeplink"]}');

        if (message.notification != null) {
          showFlutterNotification(message);
        }
      });
    }
  }
}
