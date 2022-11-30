import 'package:flutter/material.dart';
import 'package:interview_task/ui/screens/auth/auth_screen.dart';
import 'package:interview_task/ui/screens/auth/auth_viewmodel.dart';
import 'package:interview_task/ui/screens/home/home_screen.dart';
import 'package:interview_task/ui/screens/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

class RouteHelper {
  static Map<String, WidgetBuilder> createRoutes() {
    return {
      AuthScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => AuthViewModel(),
            child: const AuthScreen(),
          ),
      HomeScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => HomeViewModel(),
            child: const HomeScreen(),
          ),
    };
  }
}
