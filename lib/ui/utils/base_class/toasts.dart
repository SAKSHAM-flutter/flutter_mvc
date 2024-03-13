import 'package:flutter/material.dart';
import 'package:mvc_flutter/my_app/my_app.dart';
import 'package:mvc_flutter/ui/themes/colors.dart';
import 'package:mvc_flutter/ui/themes/typography.dart';

void errorToast(String message) {
  Toast.show(message, backgroundColor: AppColors.redError);
}

void successToast(String message) {
  Toast.show(message, backgroundColor: Colors.green);
}

class Toast {
  static void show(String msg,
      {Color textColor = Colors.white,
      Color backgroundColor = Colors.transparent}) {
    if (navigatorKey.currentContext != null) {
      dismiss();
      Future.delayed(const Duration(seconds: 1), () {
        dismiss();
      });
      Toast._createView(
          msg, navigatorKey.currentContext!, backgroundColor, textColor);
    }
  }

  static OverlayEntry? _overlayEntry;
  static bool isVisible = false;

  static void _createView(
    String msg,
    BuildContext context,
    Color background,
    Color textColor,
  ) async {
    var overlayState = Overlay.of(context);

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => _ToastAnimatedWidget(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: Material(
                color: Colors.transparent,
                elevation: 0,
                child: Text(
                  msg,
                  softWrap: true,
                  style: Poppins.medium(textColor).s12,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    isVisible = true;
    if (_overlayEntry != null) {
      overlayState.insert(_overlayEntry!);
    }
  }

  static dismiss() async {
    if (!isVisible) {
      return;
    }
    isVisible = false;
    _overlayEntry?.remove();
  }
}

class _ToastAnimatedWidget extends StatefulWidget {
  const _ToastAnimatedWidget({
    required this.child,
  });

  final Widget child;

  @override
  _ToastWidgetState createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastAnimatedWidget>
    with SingleTickerProviderStateMixin {
  bool get _isVisible => true; //update this value later

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: _isVisible ? 1.0 : 0.0,
        child: widget.child,
      ),
    );
  }
}
