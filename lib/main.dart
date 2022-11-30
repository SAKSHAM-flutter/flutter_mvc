import 'package:flutter/material.dart';
import 'package:interview_task/data/local/shared_pref_helper.dart';
import 'package:interview_task/routes.dart';
import 'package:interview_task/ui/screens/auth/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      routes: RouteHelper.createRoutes(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: initialRoute(),
    );
  }

  String initialRoute() {
    return AuthScreen.route;
  }
}
