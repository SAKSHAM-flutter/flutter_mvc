import 'dart:async';
import 'dart:collection';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:mvc_flutter/data/utils/log_tags.dart';
import 'package:mvc_flutter/my_app/my_app.dart';
import 'package:mvc_flutter/ui/utils/base_class/inetrnet_connection_interupt.dart';

class NetworkConnection {
  NetworkConnection._();

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

mixin InternetConnectionQueue {
   final Queue<Function> _functionQueue = Queue();

   void addToQueue(Function function) {
    if (!_functionQueue.contains(function)) {
      _functionQueue.add(function);
    }
    log("addToQueue working", name: LogTags.internetQueue);
    if (_functionQueue.length == 1) {
      executeQueuedFunctions();
    }
  }

   Future<void> executeQueuedFunctions() async {
    log(
      "Checking Function In Pending ${_functionQueue.length}",
      name: LogTags.internetQueue,
    );
    if (NetworkConnection.isNetworkAvailable.value) {
      while (_functionQueue.isNotEmpty) {
        final function = _functionQueue.first;
        try {
          await function();
          log("executeQueuedFunctions working", name: LogTags.internetQueue);
        } catch (e) {
          log('Error executing function: $e', name: LogTags.internetQueue);
        }
        _functionQueue.removeFirst();
      }
    }
  }
}
