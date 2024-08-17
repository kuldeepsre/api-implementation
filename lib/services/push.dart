import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../bloc/notification/notification_bloc.dart';
import '../model/push_notification';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class FirebaseApi {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final NotificationBloc _notificationBloc;

  FirebaseApi(this._notificationBloc);

  void initialize() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    _requestPermissions();
    _listenToMessages();
    _checkForInitialMessage();
    _getToken();
    _handleTokenRefresh();
    _setupLocalNotifications();
  }

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print("Handling a background message: ${message.messageId}");
    _handleNotification(message);
  }

  void _requestPermissions() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void _listenToMessages() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleNotification(message);
      _showNotificationPopup(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleNotification(message);
    });
  }

  void _checkForInitialMessage() async {
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleNotification(initialMessage);
    }
  }

  void _handleNotification(RemoteMessage message) {
    final notification = PushNotification(
      title: message.notification?.title,
      body: message.notification?.body,
      dataTitle: message.data['title'],
      dataBody: message.data['body'],
    );
    _notificationBloc.add(NotificationReceived(notification));
  }

  Future<void> _showNotificationPopup(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
      payload: message.data['payload'],
    );
  }

  Future<void> _getToken() async {
    String? token = await _messaging.getToken();
    print("FCM Token: $token");
  }

  void _handleTokenRefresh() {
    _messaging.onTokenRefresh.listen((String newToken) {
      print("FCM Token refreshed: $newToken");
    });
  }

  void _setupLocalNotifications() {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
}