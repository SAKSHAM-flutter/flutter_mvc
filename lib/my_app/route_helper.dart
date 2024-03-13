import 'package:flutter/material.dart';
import 'package:mvc_flutter/my_app/splash.dart';
import 'package:mvc_flutter/ui/screens/home/home_screen.dart';
import 'package:mvc_flutter/ui/screens/home/home_viewmodel.dart';
import 'package:mvc_flutter/ui/utils/base_class/inetrnet_connection_interupt.dart';
import 'package:mvc_flutter/ui/utils/base_class/something_went_wrong.dart';
import 'package:provider/provider.dart';

class RouteHelper {
  static Map<String, WidgetBuilder> createRoutes() {
    return {
      InternetConnection.route: (_) => const InternetConnection(),
      SomethingWrong.route: (_) => const SomethingWrong(),
      SplashScreen.route: (_) => const SplashScreen(),
      HomeScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => HomeViewModel(),
            child: const HomeScreen(),
          )
    };
  }
}
