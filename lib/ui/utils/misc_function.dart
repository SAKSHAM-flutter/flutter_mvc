import 'package:flutter/cupertino.dart';

void hideKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}
