
import 'package:mvc_flutter/data/local/validations/constant_message.dart';
import 'package:mvc_flutter/ui/utils/custom_extension.dart';

mixin CommonValidations {
  String? isValidPassword(String? password) {
    RegExp rex = ValidationConstant.passwordValidRegEx;
    if (password.isNull()) {
      return ValidationConstant.blankPassword;
    } else if (password!.trim().length < ValidationConstant.passwordMinLength) {
      return ValidationConstant.passwordLengthError;
    } else if (!rex.hasMatch(password)) {
      return ValidationConstant.passwordRegExInvalid;
    } else {
      return null;
    }
  }

  String? isPasswordAndConfirmValid(String? password, String? confirmPassword) {
    if (confirmPassword.isNull()) {
      return ValidationConstant.blankConfirmPassword;
    } else if (confirmPassword != password) {
      return ValidationConstant.passwordNotMatched;
    } else {
      return null;
    }
  }

  String? isOldPasswordAndNewValid(String? password, String? newPassword) {
    if (newPassword == password) {
      return ValidationConstant.oldAndNewPasswordSame;
    } else {
      return null;
    }
  }

  String? isValidEmail(String? email) {
    if (email.isNull()) {
      return ValidationConstant.blankEmail;
    }
    final isValid = ValidationConstant.emailValidRegEx.hasMatch(email!.trim());
    if (isValid) {
      return null;
    } else {
      return ValidationConstant.invalidMail;
    }
  }

  String? isValidMobile(String? value) {
    if (value.isNull()) {
      return ValidationConstant.blankMobile;
    } else if (/*value!.substring(0, 1) == "0" ||*/ int.tryParse(value!) == 0) {
      return ValidationConstant.invalidMobile;
    } else if (value.trim().length < ValidationConstant.mobileMinLength ||
        value.trim().length > ValidationConstant.mobileMaxLength) {
      return ValidationConstant.invalidMobile;
    } else {
      return null;
    }
  }

  String? isValidCode(String? value) {
    if (value.isNull()) {
      return ValidationConstant.blankVerificationCode;
    } else if (value!.trim().length != ValidationConstant.otpLength) {
      return ValidationConstant.verificationCodeLengthError;
    } else {
      return null;
    }
  }

  String? isRequiredField(String field, String? value) {
    if (value.isNull()) {
      return '$field ${ValidationConstant.isRequired}';
    } else {
      return null;
    }
  }

  String? isEnteredField(String field, String? value) {
    if (value.isNull()) {
      return '${ValidationConstant.pleaseEnter} $field';
    } else {
      return null;
    }
  }

  String? isValidZipCode(String? value) {
    if (value.isNull()) {
      return ValidationConstant.blankZipCode;
    } else if (value!.length < 5) {
      return ValidationConstant.zipCodeLengthError;
    } else {
      return null;
    }
  }

  String? isSelectedField(String field, String? value) {
    if (value.isNull()) {
      return '${ValidationConstant.pleaseSelect} $field';
    } else {
      return null;
    }
  }
}
