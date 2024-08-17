import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:push/login_form.dart';


import '../main.dart';
import '../presentation/notification.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case RoutePaths.splashScreen:
        return MaterialPageRoute(builder: (_) =>  LoginForm());


      case RoutePaths.NotificationScreen:
        return MaterialPageRoute(
          builder: (_) => Notifications(

          ),
        );
    /*  case RoutePaths.NotificationDetailScreen:
        return MaterialPageRoute(
          builder: (_) => NotificationDetailScreen(
            payload: arguments?['payload'] ?? '',
          ),
        );*/
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class RoutePaths {
  static const String splashScreen = '/';
  static const String dashboard = '/dashboard';
  static const String NotificationScreen = '/NotificationScreen';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgotPassword';
  static const String changepassword = '/changepassword';
  static const String setting = '/setting';
  static const String OnboardingScreen = '/OnboardingScreen';
  static const String ProductsPage = '/ProductsPage';
  static const String NotificationDetailScreen = '/NotificationDetailScreen';
}