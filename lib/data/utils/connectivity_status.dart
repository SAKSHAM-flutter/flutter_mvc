import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:mvc_flutter/data/utils/log_tags.dart';
import 'package:mvc_flutter/my_app/my_app.dart';
import 'package:mvc_flutter/ui/utils/base_class/inetrnet_connection_interupt.dart';

class NetworkConnection {
  static late StreamSubscription streamSubscription;
  static ValueNotifier<bool> isNetworkAvailable = ValueNotifier(false);
  static bool isAvailable = false;

  static void networkStreaming() {
    streamSubscription = Connectivity().onConnectivityChanged.listen((event) {
      BuildContext? context = navigatorKey.currentContext;
      if (event == ConnectivityResult.none) {
        isNetworkAvailable.value = false;
        isAvailable = false;
        if (context != null) {
          Navigator.pushNamed(context, InternetConnection.route);
        }
      } else {
        isNetworkAvailable.value = true;
        isAvailable = true;
        if (context != null) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        }
      }
      log(
        "Network Changed: isNetworkOn- $isAvailable Type ${event.name}",
        name: LogTags.network,
      );
    });
  }

  static Future<void> checkInternetAgain() async {
    if (!isAvailable) {
      if (navigatorKey.currentContext != null) {
        await Navigator.pushNamed(
            navigatorKey.currentContext!, InternetConnection.route);
      }
    }
  }
}
