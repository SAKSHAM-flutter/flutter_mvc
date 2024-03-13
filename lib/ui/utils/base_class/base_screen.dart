import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mvc_flutter/ui/utils/base_class/loading.dart';
import 'package:mvc_flutter/ui/utils/base_class/toasts.dart';
import 'package:mvc_flutter/ui/utils/base_class/view_model.dart';
import 'package:provider/provider.dart';

class ScreenBase<VIEW_MODEL extends ViewModel> extends StatefulWidget {
  final Widget child;
  final VoidCallback? onBack;
  final ValueChanged<String>? onError;

  const ScreenBase({
    Key? key,
    required this.child,
    this.onError,
    this.onBack,
  }) : super(key: key);

  @override
  State<ScreenBase<VIEW_MODEL>> createState() => _ScreenBaseState<VIEW_MODEL>();
}

class _ScreenBaseState<VIEW_MODEL extends ViewModel>
    extends State<ScreenBase<VIEW_MODEL>> {
  static DateTime? currentBackPressTime;

  void backClick() {
    DateTime now = DateTime.now();
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else if (currentBackPressTime == null ||
        now.difference(currentBackPressTime ?? now) >
            const Duration(seconds: 2)) {
      currentBackPressTime = now;
      errorToast("Double Click To Exit App");
    } else {
      exit(0);
    }
  }

  @override
  void initState() {
    getViewModel<VIEW_MODEL>(context, (viewModel) {
      viewModel.onError = (String? errorMessage) {
        if (errorMessage == null) return;
        if (widget.onError == null) {
          errorToast(errorMessage);
        } else {
          widget.onError?.call(errorMessage);
        }
      };
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (did) {
        if (!did) {
          if (widget.onBack == null) {
            backClick();
          } else {
            widget.onBack?.call();
          }
        }
      },
      child: SafeArea(
        child: Stack(
          children: [
            widget.child,
            LoadingIndicatorConsumer<VIEW_MODEL>(),
          ],
        ),
      ),
    );
  }
}

class ScreenBaseScaffold<VIEW_MODEL extends ViewModel> extends StatelessWidget {
  final Widget child;
  final Widget? bottom, navigation;
  final VoidCallback? onBack;
  final ValueChanged<String>? onError;
  final PreferredSizeWidget? appBar;

  const ScreenBaseScaffold({
    Key? key,
    required this.child,
    this.bottom,
    this.onBack,
    this.onError,
    this.appBar,
    this.navigation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBase<VIEW_MODEL>(
      onBack: onBack,
      onError: onError,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: appBar,
        body: child,
        bottomSheet: bottom,
        bottomNavigationBar: navigation,
      ),
    );
  }
}

////With the help of this extension get some additional function's accessibility;
extension Context on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;

  double get width => MediaQuery.sizeOf(this).width;

  VIEW_Model model<VIEW_Model extends ViewModel>() {
    return read<VIEW_Model>();
  }
}
