

import 'package:easy_localization/easy_localization.dart';

class ValidationConstant {
  static RegExp emailInputRegEx = RegExp(r'^[A-Za-z0-9_.@]+$');
  static RegExp nameInputRegEx = RegExp(r'^[a-zA-Z]*$');
  static RegExp emailValidRegEx = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );
  static RegExp passwordValidRegEx = RegExp(
      (r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[+×÷=/_€£₹₩!@#%$^&*()-:;,?`~\|<]).{8,}$'));
  static const int passwordMinLength = 8;
  static const int mobileMinLength = 5;
  static const int maxPassword = 16;
  static const int maxNames = 35;
  static const int maxZipCode = 6;
  static const int otpLength = 4;
  static const int zipLength = 5;
  static const int mobileMaxLength = 15;
  static const int emailMaxLength = 50;

  static String pleaseSelect = 'pleaseSelect'.tr();
  static String pleaseEnter = 'pleaseEnter'.tr();
  static String isRequired = 'isRequired'.tr();
  static String withoutCredential = "withoutCredential".tr();
  static String blankEmail = "blankEmail".tr();
  static String invalidMail = "invalidMail".tr();
  static String blankMobile = "blankMobile".tr();
  static String blankZipCode = "blankZipCode".tr();
  static String zipCodeLengthError = "zipCodeLengthError".tr();
  static String invalidMobile = "invalidMobile".tr();
  static String blankUserName = "blankUserName".tr();
  static String blankPassword = "blankPassword".tr();
  static String blankConfirmPassword = "blankConfirmPassword".tr();
  static String passwordNotMatched = "passwordNotMatched".tr();
  static String signUpFieldsBlank = "signUpFieldsBlank".tr();
  static String blankName = "blankName".tr();
  static String blankVerificationCode = "blankVerificationCode".tr();
  static String verificationCodeLengthError =
      "verificationCodeLengthError".tr();
  static String oldAndNewPasswordSame = "oldAndNewPasswordSame".tr();
  static String passwordRegExInvalid = 'passwordRegExInvalid'.tr();
  static String passwordLengthError = 'passwordLengthError'.tr();
  static String logOutTitle = 'logOutTitle'.tr();
  static String enterMessage = 'enterMessage'.tr();
  static String genericErrorMessage = "genericErrorMessage".tr();
  static String internetErrorMessage = "internetErrorMessage".tr();
  static String serverErrorMessage = "serverErrorMessage".tr();
  static String formatExceptionMessage = "formatExceptionMessage".tr();
}
