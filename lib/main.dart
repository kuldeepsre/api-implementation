import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push/api/api_services.dart';
import 'package:push/bloc/login/login_bloc.dart';
import 'package:push/bloc/notification/notification_bloc.dart';
import 'package:push/model/Option.dart';
import 'package:push/repositry/form_repository/login_repo.dart';
import 'package:push/services/push.dart';
import 'package:push/presentation/HomePage.dart';


import 'bloc/dashboard/category/category_bloc.dart';
import 'bloc/dashboard/product/product_bloc.dart';
import 'bloc/dashboard/vagitable/vigitable_bloc.dart';
import 'bloc/filter_bloc/filter_bloc.dart';
import 'bloc/selection/selection_bloc.dart';
import 'home.dart';
import 'login_form.dart';
import 'dart:async';
import 'package:provider/provider.dart';
final GlobalKey<NavigatorState> navigatorKey =
new GlobalKey<NavigatorState>();
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
  // Handle your background message here
}
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "PushNotify",
      options: const FirebaseOptions(
        appId: "1:1023989688797:android:168e78234b404328fe6e34",
        messagingSenderId: "1023989688797 ",
        projectId: "pushnotify-18ef4",
        apiKey: "AIzaSyAqHRGBokhXJzLVSzj7ilXfjOrckLC92Z0",
      ));
  // Initialize local notifications
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Register the background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  NotificationBloc notificationBloc=NotificationBloc();
  await FirebaseApi(notificationBloc);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers:[
        BlocProvider<LoginBloc>(create: (context) => LoginBloc(LoginPostRepositoryImpl(ApiService()))),
        BlocProvider<NotificationBloc>(create: (context) => NotificationBloc()),
        BlocProvider<FilterBloc>(create: (context) => FilterBloc()),
        BlocProvider<CategoryBloc>(create: (context) => CategoryBloc()..add(LoadCategories())),
        BlocProvider<ProductBloc>(create: (context) => ProductBloc()..add(LoadProducts(1))),
        BlocProvider<VegetableBloc>(create: (context) => VegetableBloc()..add(FetchVegetables())),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        /*  title: 'Flutter Demo',*/
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  HomeScreen(),
      ),
    );
  }
}