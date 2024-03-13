import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvc_flutter/data/utils/connectivity_status.dart';
import 'package:mvc_flutter/ui/utils/misc_function.dart';
import 'package:provider/provider.dart';

///Base Class for encapsulating logic related to Loading Status management, and error handling
///Use of this class is helpful while using classes such as
///[LoadingIndicatorConsumer], [CommonButtonLoading], [ScreenBase]
///All of the above mentioned classes take generic parameters
class ViewModel extends ChangeNotifier {
  static const genericErrorMessage =
      "Something went wrong, Please try again later";
  bool _isLoading = false;

  set isLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  ///error message for showing in snackBar
  ValueChanged<String?>? onError;

  void callApi(AsyncCallback api, [bool hidekey = true]) {
    isLoading = true;
    if (hidekey) {
      hideKeyBoard();
    }
    if (NetworkConnection.isAvailable) {
      api().then((_) {
        isLoading = false;
      }).catchError((th, stackTrace) {
        isLoading = false;
        developer.log("Caught Error while calling api: $th");
        developer.log("Type of Exception: ${th.runtimeType}");
        developer.log('Stack Trace: $stackTrace');
        onError?.call(genericErrorMessage);
      });
    } else {
      onError?.call(genericErrorMessage);
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
