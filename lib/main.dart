import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push/api/api_services.dart';
import 'package:push/bloc/login/login_bloc.dart';
import 'package:push/repositry/form_repository/login_repo.dart';


import 'login_form.dart';
import 'dart:async';
import 'package:provider/provider.dart';
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
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       /*  title: 'Flutter Demo',*/
         theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
         useMaterial3: true,
        ),
        home:  LoginForm(),
      ),
    );
  }
}
