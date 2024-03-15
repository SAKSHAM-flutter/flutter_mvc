import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvc_flutter/data/local/validations/constant_message.dart';
import 'package:mvc_flutter/data/utils/connectivity_status.dart';
import 'package:provider/provider.dart';

///Base Class for encapsulating logic related to Loading Status management, and error handling
///Use of this class is helpful while using classes such as
///[LoadingIndicatorConsumer], [CommonButtonLoading], [ScreenBase]
///All of the above mentioned classes take generic parameters
class ViewModel extends ChangeNotifier  {
  bool _isLoading = false;

  set isLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  ///error message for showing in snackBar
  ValueChanged<String?>? onError;

  void _checkInternet(AsyncCallback api) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        onError?.call(ValidationConstant.serverErrorMessage);
      } else {
        NetworkConnection.addToQueue(api);
        onError?.call(ValidationConstant.internetErrorMessage);
      }
    } on SocketException catch (_) {
      NetworkConnection.addToQueue(api);
      onError?.call(ValidationConstant.internetErrorMessage);
    }
  }

  void callApi(AsyncCallback api, {ValueChanged<String>? catchError}) {
    if (NetworkConnection.isAvailable) {
      isLoading = true;
      api().then((_) {
        isLoading = false;
      }).catchError((th, stackTrace) {
        isLoading = false;
        if (catchError == null) {
          if (th is SocketException) {
            _checkInternet(api);
          } else if (th is FormatException) {
            onError?.call(
                "${ValidationConstant.formatExceptionMessage} ${th.message}");
          } else if (th is HttpException) {
            onError?.call(th.message);
          } else if (th is TimeoutException) {
            onError?.call(ValidationConstant.serverErrorMessage);
          } else {
            onError?.call(ValidationConstant.genericErrorMessage);
          }
        } else {
          catchError.call(ValidationConstant.genericErrorMessage);
        }
        developer.log("Caught Error while calling api: $th");
        developer.log("Type of Exception: ${th.runtimeType}");
        developer.log('Stack Trace: $stackTrace');
      });
    } else {
      NetworkConnection.addToQueue(api);
      if (catchError != null) {
        catchError.call(ValidationConstant.internetErrorMessage);
      } else {
        onError?.call(ValidationConstant.internetErrorMessage);
      }
    }
  }

  ///subclasses should override this method.
  ///in order to reset the state of this ViewModel.
  void invalidate() {}
}

///should be used if we want to access viewModel inside initState method of a StateFul Widget.
void getViewModel<VIEW_MODEL extends ViewModel>(
  BuildContext context,
  void Function(VIEW_MODEL viewModel) function,
) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final provider = Provider.of<VIEW_MODEL>(context, listen: false);
    function.call(provider);
  });
}
