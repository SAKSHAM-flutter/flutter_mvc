import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mvc_flutter/my_app/my_app.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage remoteMessage) async {
  await NotificationHandler.initialize();
  log(remoteMessage.data.toString(), name: "Background Notification");

  ///TODO Handling Background Message Notification
}

@pragma('vm:entry-point')
void didReceiveBackgroundNotificationResponseCallback(
    NotificationResponse response) async {
  log(response.notificationResponseType.name,
      name: "onDidReceiveBackgroundNotificationResponse");
  log(response.payload ?? "Empty Payload",
      name: "onDidReceiveBackgroundNotificationResponse Payload");
  log(response.input ?? "Empty Input",
      name: "onDidReceiveBackgroundNotificationResponse Input");

  ///TODO Handling Background Message Notification
}

class NotificationHandler {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static Future<void> initialize() async {
    try {
      await Firebase.initializeApp(
          // options: DefaultFirebaseOptions.currentPlatform,
          );
      await _firebaseInit();
      if (Platform.isIOS) {
        await _flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin>()
            ?.requestPermissions(
              alert: true,
              badge: true,
              sound: true,
            );
      } else {
        await _flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.requestNotificationsPermission();
      }
      const androidInitializationSettings =
          AndroidInitializationSettings("@mipmap/ic_launcher");
      const darwinInitializationSettings = DarwinInitializationSettings(
          requestProvisionalPermission: true, requestCriticalPermission: true);
      InitializationSettings settings = const InitializationSettings(
        android: androidInitializationSettings,
        iOS: darwinInitializationSettings,
      );
      await _flutterLocalNotificationsPlugin.initialize(
        settings,
        onDidReceiveBackgroundNotificationResponse:
            didReceiveBackgroundNotificationResponseCallback,
        onDidReceiveNotificationResponse: (response) {
          //ToDo
          ///Handle notification responses;
          log(response.notificationResponseType.name,
              name: "onDidReceiveNotificationResponse");
          log(response.payload ?? "Empty Payload",
              name: "onDidReceiveNotificationResponse Payload");
          log(response.input ?? "Empty Input",
              name: "onDidReceiveNotificationResponse Input");
        },
      );
    } catch (_) {}
  }

  static Future<void> _firebaseInit() async {
    try {
      NotificationSettings notificationSettings =
          await _messaging.requestPermission();
      log(notificationSettings.authorizationStatus.name,
          name: "Notification Permission");

      ///Whenever User Click On Background Notification App Is Terminated....Handle On Tap Through This Method!!
      _messaging.getInitialMessage().then((remoteMessage) {
        if (remoteMessage != null) {
          log("Notification Click Event On Background Application. Data ${remoteMessage.data}, Title ${remoteMessage.notification?.title}");
          Future.delayed(const Duration(seconds: 2), () {
            if (navigatorKey.currentContext != null) {
              ///ToDo Notification Handle On background notification click;
            }
          });

          ///ToDo Notification Handle On Click;
        }
      });

      ///Whenever Notification Coming And App Is Not Terminated And Open In Background Only For Show Notification..!!
      FirebaseMessaging.onMessage.listen((remoteMessage) {
        log("On Message Notification Data ${remoteMessage.notification.toString()}, Title ${remoteMessage.notification?.title}");
        try {
          showLocalNotification(remoteMessage);
        } catch (_) {
          log("Error Catch $_");
        }

        ///ToDo Notification Show On Coming From Firebase;
      });

      ///Whenever User Click On Background Notification App Is Not Terminated Working In Background....Handle On Tap Through This Method!!
      FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
        log("Background App Notification Data ${remoteMessage.data}, Title ${remoteMessage.notification?.title}");

        ///ToDo Notification Handle On Click;
      });
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    } catch (_) {}
  }

  static Future<String> getToken() async {
    try {
      // if (Platform.isIOS) {
      //   String? apn = await _messaging.getAPNSToken();
      // }
      return await _messaging.getToken() ?? "";
    } catch (_, st) {
      log('Stack Trace $st');
      return "";
    }
  }

  static Future<void> showLocalNotification(RemoteMessage remoteMessage) async {
    log("Check Data ${remoteMessage.toMap()}");
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      remoteMessage.messageId ?? "notification",
      "Friend Notification",
      color: Colors.transparent,
      importance: Importance.max,
      priority: Priority.high,
      channelShowBadge: true,
      // largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
    );
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
      presentBanner: true,
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );
    String title =
        remoteMessage.notification?.title ?? remoteMessage.data["title"];
    String body =
        remoteMessage.notification?.body ?? remoteMessage.data["body"] ?? "";
    log("remoteMessage showLocalNotification ${remoteMessage.toString()}, Title $title Body $body");
    await _flutterLocalNotificationsPlugin.show(
      remoteMessage.ttl ?? 0,
      title,
      body,
      notificationDetails,
      payload: jsonEncode(
        remoteMessage.toMap(),
      ),
    );
  }

  static Future<void> clearNotification([int? id]) async {
    try {
      if (id != null) {
        await _flutterLocalNotificationsPlugin.cancel(id);
      } else {
        await _flutterLocalNotificationsPlugin.cancelAll();
      }
    } catch (_) {}
  }
}
