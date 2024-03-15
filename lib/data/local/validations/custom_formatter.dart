import 'package:flutter/services.dart';
import 'package:mvc_flutter/data/local/validations/constant_message.dart';

class EmailTextFormatter extends TextInputFormatter {
  EmailTextFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String newText =
        ValidationConstant.emailInputRegEx.stringMatch(newValue.text) ?? "";
    TextEditingValue finalText = newText == newValue.text ? newValue : oldValue;
    if (finalText.text.length > 55) {
      finalText.text.substring(0, 55);
    }
    return finalText;
  }
}

class NameTextFormatter extends TextInputFormatter {
  NameTextFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (ValidationConstant.nameInputRegEx
          .hasMatch(newValue.text.trim().replaceAll(" ", ""))) {
        return newValue;
      } else {
        return oldValue;
      }
    } else {
      return newValue;
    }
  }
}
