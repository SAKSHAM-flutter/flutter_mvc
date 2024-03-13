import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvc_flutter/data/local/local_storage.dart';
import 'package:mvc_flutter/data/utils/connectivity_status.dart';
import 'package:mvc_flutter/my_app/my_app.dart';
import 'package:mvc_flutter/ui/themes/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NetworkConnection.networkStreaming();
  await Prefs.init();
  FlutterError.onError = ((error) {
    log("Error Stack ${error.stack}");
    log("Error Context  ${error.context?.name}");
    // if (navigatorKey.currentContext != null) {
    //   Navigator.push(navigatorKey.currentContext!,
    //       MaterialPageRoute(builder: (ctx) => const SomethingWrong()));
    // }
  });
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ThemeNotifier())],
          child: const MyApp()),
    ),
  );
}
